# # controlCode_CLEAN.py
# Stable version with separated control + logging threads

import time
import _thread
from machine import Pin, PWM, I2C
import struct

# ---------------- PARAMETERS ----------------
DT = 0.01  # 100 Hz control loop
LOG_DT = 0.05  # 20 Hz logging

MAX_LINEAR_SPEED_x = 23.3
MAX_LINEAR_SPEED_y = 23.3

MAX_RPM_A = 5.5
MAX_DEG_PER_SEC_A = (MAX_RPM_A * 360) / 60

PWM_MAX = 1023

# ---------------- IMU ----------------
IMU1_ADDR = 0x6A
IMU2_ADDR = 0x6B

CTRL1_XL = 0x10
CTRL2_G  = 0x11
OUTX_L_A = 0x28

i2c = I2C(0, scl=Pin(22), sda=Pin(21), freq=400000)

# ---------------- PWM ----------------
x_pwm = PWM(Pin(14), freq=1000)
y_pwm = PWM(Pin(15), freq=1000)
a_pwm = PWM(Pin(32), freq=1000)

x_pwm.duty(0)
y_pwm.duty(0)
a_pwm.duty(0)

dir_pin = Pin(4, Pin.OUT)

# ---------------- STATE ----------------
run_state = {
    "running": False,
    "paused": False,
    "current_step": 0,
    "trajectory_queue": [],
    "current_traj": 0,
    "loop_enabled": False,
    "loop_count": 1,
    "loop_current": 0,
}

# shared data for logger
latest_command = (0, 0, 0)
log_buffer = []
BUFFER_SIZE = 25
log_file = "imu_log.csv"

# ---------------- UTILS ----------------
def set_pwm(pwm, value):
    value = max(0.0, min(1.0, value))
    duty = int(value * PWM_MAX)
    pwm.duty(duty)

# ---------------- IMU ----------------
def init_imu(addr):
    try:
        i2c.writeto_mem(addr, CTRL1_XL, bytes([0x4A]))
        i2c.writeto_mem(addr, CTRL2_G, bytes([0x4C]))
        print("IMU initialized:", hex(addr))
    except:
        print("IMU init failed:", hex(addr))

def read_imu(addr):
    try:
        data = i2c.readfrom_mem(addr, OUTX_L_A, 12)
        return struct.unpack("<hhhhhh", data)
    except:
        return (0,0,0,0,0,0)

# ---------------- LOGGING THREAD ----------------
def init_log():
    with open(log_file, "w") as f:
        f.write("time,vx,vy,va,imu,ax,ay,az,gx,gy,gz\n")

def flush_log():
    global log_buffer
    if not log_buffer:
        return
    with open(log_file, "a") as f:
        for line in log_buffer:
            f.write(line)
    log_buffer = []

def logging_loop():
    global log_buffer

    while True:
        t = time.ticks_ms()

        vx, vy, va = latest_command

        imu1 = read_imu(IMU1_ADDR)
        imu2 = read_imu(IMU2_ADDR)

        log_buffer.append("{},{},{},{},1,{},{},{},{},{},{}\n".format(
            t, vx, vy, va, *imu1
        ))

        log_buffer.append("{},{},{},{},2,{},{},{},{},{},{}\n".format(
            t, vx, vy, va, *imu2
        ))

        if len(log_buffer) >= BUFFER_SIZE:
            flush_log()

        time.sleep(LOG_DT)
def set_loop_count(count):
    if count < 1:
        run_state["loop_enabled"] = False
        run_state["loop_count"] = 1
    else:
        run_state["loop_enabled"] = True
        run_state["loop_count"] = count

    run_state["loop_current"] = 0

    print("Loop enabled:", run_state["loop_enabled"])
    print("Loop count:", run_state["loop_count"])
def remove_trajectory(index):
    try:
        run_state["trajectory_queue"].pop(index)
        print("Removed index", index)
    except:
        print("Invalid index")


def move_trajectory(old_idx, new_idx):
    try:
        q = run_state["trajectory_queue"]
        item = q.pop(old_idx)
        q.insert(new_idx, item)
        print("Moved", old_idx, "to", new_idx)
    except:
        print("Move failed")
# ---------------- MANUAL JOG ----------------
def move_axis(axis, direction, distance):
    # X/Y → mm
    # A   → degrees

    if distance < 0.1:
        print("Minimum move is 0.1")
        return

    dir_pin.value(1 if direction > 0 else 0)

    # -------- LINEAR AXES --------
    if axis == 'x':
        speed = 20  # mm/s
        move_time = distance / speed
        duty = speed / MAX_LINEAR_SPEED_x
        set_pwm(x_pwm, duty)

    elif axis == 'y':
        speed = 20  # mm/s
        move_time = distance / speed
        duty = speed / MAX_LINEAR_SPEED_y
        set_pwm(y_pwm, duty)

    # -------- ROTARY AXIS (A) --------
    elif axis == 'a':
        speed = 25  # deg/sec (you can tune this)
        move_time = distance / speed

        duty = speed / MAX_DEG_PER_SEC_A
        set_pwm(a_pwm, duty)

    else:
        print("Invalid axis")
        return

    start = time.ticks_ms()

    while time.ticks_diff(time.ticks_ms(), start) < int(move_time * 1000):
        time.sleep_ms(1)

    # Stop only active axis
    if axis == 'x':
        set_pwm(x_pwm, 0)
    elif axis == 'y':
        set_pwm(y_pwm, 0)
    elif axis == 'a':
        set_pwm(a_pwm, 0)
# ---------------- CONTROL LOOP ----------------
def control_loop():
    global latest_command

    while True:

        if not run_state["running"] or run_state["paused"]:
            set_pwm(x_pwm, 0)
            set_pwm(y_pwm, 0)
            set_pwm(a_pwm, 0)
            time.sleep_ms(5)
            continue

        loop_start = time.ticks_ms()

        tq = run_state["trajectory_queue"]
        if not tq:
            stop()
            continue

        traj = tq[run_state["current_traj"]]["data"]
        step = run_state["current_step"]

        if step < len(traj):
            vx, vy, va = traj[step]

            set_pwm(x_pwm, vx)
            set_pwm(y_pwm, vy)
            set_pwm(a_pwm, va)

            latest_command = (vx, vy, va)

            run_state["current_step"] += 1

        else:
            run_state["current_traj"] += 1
            run_state["current_step"] = 0

        # handle looping
        if run_state["current_traj"] >= len(tq):
            if run_state["loop_enabled"]:
                run_state["loop_current"] += 1
                if run_state["loop_current"] < run_state["loop_count"]:
                    run_state["current_traj"] = 0
                else:
                    stop()
            else:
                stop()

        # precise timing
        elapsed = time.ticks_diff(time.ticks_ms(), loop_start)
        sleep_ms = int(DT * 1000) - elapsed
        if sleep_ms > 0:
            time.sleep_ms(sleep_ms)

# ---------------- THREAD START ----------------
def start_system():
    _thread.start_new_thread(control_loop, ())
    _thread.start_new_thread(logging_loop, ())

# ---------------- COMMANDS ----------------
def start():
    if not run_state["trajectory_queue"]:
        print("No trajectories loaded")
        return

    run_state["running"] = True
    run_state["paused"] = False
    run_state["current_step"] = 0
    run_state["current_traj"] = 0
    run_state["loop_current"] = 0
    print("Started")

def stop():
    run_state["running"] = False
    run_state["paused"] = False

    set_pwm(x_pwm, 0)
    set_pwm(y_pwm, 0)
    set_pwm(a_pwm, 0)

    flush_log()
    print("Stopped")

def pause():
    run_state["paused"] = True

def resume():
    run_state["paused"] = False

def load_trajectory(file_path):
    traj = []
    try:
        with open(file_path, "r") as f:
            lines = f.readlines()

        for line in lines[1:]:
            parts = line.strip().split(",")
            vx = float(parts[0])
            vy = float(parts[1])
            va = float(parts[2])
            traj.append((vx, vy, va))

        run_state["trajectory_queue"].append({
            "name": file_path,
            "data": traj
        })

        print("Loaded:", file_path)

    except:
        print("File error")
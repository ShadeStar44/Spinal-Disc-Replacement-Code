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
    "manual_mode": False,
    "abort": False,
    "override_active": False,
    "override": {"x": 0.0, "y": 0.0, "a": 0.0},
    "emergency_stop":False,
    "move_end": 0
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
def apply_pwm(vx, vy, va):
    set_pwm(x_pwm, vx)
    set_pwm(y_pwm, vy)
    set_pwm(a_pwm, va)
    
def background_loop():
    def loop():
        control_loop()
    _thread.start_new_thread(loop, ())
    
def get_queue_status():
    if run_state.get("traj_file"):
        return {
            "queue": [run_state["trajectory_queue"][0]["name"]],
            "current_traj": 0,
            "loop_count": run_state["loop_count"],
            "loop_current": run_state["loop_current"]
        }
    else:
        return {
            "queue": [],
            "current_traj": 0,
            "loop_count": 0,
            "loop_current": 0
        }
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
def read_imu_scaled(addr):
    try:
        data = i2c.readfrom_mem(addr, OUTX_L_A, 12)
        vals = struct.unpack("<hhhhhh", data)

        # Scale factors
        accel_scale = 0.000122  # g/LSB (±4g)
        gyro_scale  = 0.07      # dps/LSB (2000 dps)

        ax = vals[0] * accel_scale
        ay = vals[1] * accel_scale
        az = vals[2] * accel_scale

        gx = vals[3] * gyro_scale
        gy = vals[4] * gyro_scale
        gz = vals[5] * gyro_scale

        return ax, ay, az, gx, gy, gz

    except:
        return (0, 0, 0, 0, 0, 0)

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
def log_step(t, step, vx, vy, va):
    global log_buffer

    imu1 = read_imu_scaled(IMU1_ADDR)
    imu2 = read_imu_scaled(IMU2_ADDR)

    log_buffer.append(
        "{},{},{},{},{},1,{},{},{},{},{},{}\n".format(
            t, step, vx, vy, va, *imu1
        )
    )

    log_buffer.append(
        "{},{},{},{},{},2,{},{},{},{},{},{}\n".format(
            t, step, vx, vy, va, *imu2
        )
    )

    if len(log_buffer) >= BUFFER_SIZE:
        flush_log()
def set_loop_count(count):

    run_state["loop_count"] = max(1, count)
    run_state["loop_enabled"] = count > 1
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
def clear_trajectories():
    if run_state.get("traj_file"):
        run_state["traj_file"].close()

    run_state["traj_file"] = None
    run_state["trajectory_queue"] = []
    run_state["current_step"] = 0
    run_state["running"] = False

    print("Cleared")
# ---------------- MANUAL JOG ----------------
def move_axis(axis, direction, distance):

    if distance < 0.1:
        print("Minimum move is 0.1")
        return

    print("Manual move:", axis, direction, distance)

    #  Enter manual override
    run_state["manual_mode"] = True
    run_state["abort"] = False

    dir_pin.value(1 if direction > 0 else 0)

    # -------- SPEED CONFIG --------
    if axis == 'x':
        speed = 20  # mm/s
        duration = distance / speed
        duty = speed / MAX_LINEAR_SPEED_x
        pwm = x_pwm

    elif axis == 'y':
        speed = 20
        duration = distance / speed
        duty = speed / MAX_LINEAR_SPEED_y
        pwm = y_pwm

    elif axis == 'a':
        speed = 25  # deg/s
        duration = distance / speed
        duty = speed / MAX_DEG_PER_SEC_A
        pwm = a_pwm

    else:
        print("Invalid axis")
        run_state["manual_mode"] = False
        return

    # Apply motion
    set_pwm(pwm, duty)

    start = time.ticks_ms()

    while time.ticks_diff(time.ticks_ms(), start) < int(duration * 1000):

        #  Allow STOP to interrupt manual move
        if run_state["abort"]:
            print("Manual move aborted")
            break

        time.sleep_ms(5)

    # Stop motor
    set_pwm(pwm, 0)

    # Exit manual mode
    run_state["manual_mode"] = False

    print("Manual move complete")
# ---------------- CONTROL LOOP ----------------
def control_loop():

    print("CONTROL LOOP STARTED")

    while True:
         # -------- HARD STOP --------
        if run_state["abort"]:
            apply_pwm(0, 0, 0)
            time.sleep_ms(5)
            continue

    # -------- MANUAL MODE (DO NOTHING HERE) --------
        if run_state["manual_mode"]:
            # Let move_axis control PWM
            time.sleep_ms(5)
            continue

    # -------- NOT RUNNING --------
        if not run_state["running"]:
            apply_pwm(0, 0, 0)
            time.sleep_ms(5)
            continue

    # -------- PAUSED --------
        if run_state["paused"]:
            apply_pwm(0, 0, 0)
            time.sleep_ms(5)
            continue

        loop_start = time.ticks_ms()

        step = get_next_step()

        if step:
            vx, vy, va = step
            if (vx or vy or va) <= 0:
                vx = vx*-1
                vy = vy*-1
                va = va*-1
                dir_pin.value(0)
            apply_pwm(vx, vy, va)

            latest_command = (vx, vy, va)

            log_step(loop_start, run_state["current_step"], vx, vy, va)

            run_state["current_step"] += 1

        else:
            print("Trajectory complete")

            if run_state["loop_enabled"]:

                run_state["loop_current"] += 1
                print("Loop:", run_state["loop_current"], "/", run_state["loop_count"])

                if run_state["loop_current"] < run_state["loop_count"]:

                    # rewind file
                    f = run_state["traj_file"]
                    f.seek(0)

                    if run_state["traj_format"] == "csv":
                        f.readline()

                    run_state["current_step"] = 0

                else:
                    print("All loops done")
                    stop()

            else:
                stop()
# ---------------- THREAD START ----------------
def start_system():
    _thread.start_new_thread(control_loop, ())
    _thread.start_new_thread(logging_loop, ())

# ---------------- COMMANDS ----------------
def start():

    if not run_state.get("traj_file"):
        print("No trajectory loaded")
        return

    run_state["running"] = True
    run_state["paused"] = False
    run_state["abort"] = False
    run_state["emergency_stop"] = False

    run_state["current_step"] = 0
    run_state["loop_current"] = 0

    # rewind file EVERY start
    f = run_state["traj_file"]
    f.seek(0)

    if run_state["traj_format"] == "csv":
        f.readline()

    print("STARTED")

def stop():

    print("STOP CALLED")

    run_state["emergency_stop"] = True
    run_state["running"] = False
    run_state["paused"] = False
    run_state["override_active"] = False

    run_state["current_step"] = 0
    run_state["current_traj"] = 0

    apply_pwm(0, 0, 0)

    flush_log()

    time.sleep_ms(50)
    run_state["emergency_stop"] = False

    print("STOPPED")
def pause():
    run_state["paused"] = True

def resume():
    run_state["paused"] = False
import struct

STEP_SIZE = 17

def get_next_step():
    f = run_state.get("traj_file")

    if not f:
        print("No file open")
        return None

    try:
        # -------- BINARY --------
        if run_state["traj_format"] == "bin":
            chunk = f.read(STEP_SIZE)

            if not chunk or len(chunk) < STEP_SIZE:
                print("End of file reached")
                return None

            vx, vy, vz, va, d = struct.unpack("<ffffB", chunk)

            #  DEBUG (remove later)
            print("STEP:", vx, vy, va)

            return vx, vy, va

        # -------- CSV --------
        else:
            line = f.readline()

            if not line:
                print("End of CSV")
                return None

            parts = line.strip().split(",")

            vx = float(parts[0])
            vy = float(parts[1])
            va = float(parts[2])

            return vx, vy, va

    except Exception as e:
        print("Read error:", e)
        return None
def load_trajectory(file_path):
    if run_state["running"]:
        print("Stop system before loading trajectory")
        return

    try:
        # Close old file if exists
        if run_state.get("traj_file"):
            try:
                run_state["traj_file"].close()
            except:
                pass

        # -------- OPEN FILE --------
        if file_path.endswith(".bin"):
            f = open(file_path, "rb")
            run_state["traj_format"] = "bin"
        else:
            f = open(file_path, "r")
            f.readline()  # skip CSV header
            run_state["traj_format"] = "csv"

        # -------- VERIFY FILE --------
        size = f.seek(0, 2)
        f.seek(0)

        print("File size:", size)

        if size == 0:
            print("ERROR: File is empty")
            f.close()
            return

        # -------- STORE STATE --------
        run_state["traj_file"] = f
        run_state["current_step"] = 0

        # Virtual queue entry (for GUI compatibility)
        run_state["trajectory_queue"] = [{
            "name": file_path,
            "data": None
        }]
        run_state["current_traj"] = 0

        print("Streaming trajectory loaded:", file_path)

    except Exception as e:
        print("File error:", e)
# controlCode_PCB.py (MicroPython ESP32 version)
# By:Alexander Olson
# This code runs on the ESP32 microcontroller and handles trajectory execution, IMU data logging
# The pin allocations in this code ARE the same ones used in on the PCB. 
import time
import _thread
from machine import Pin, PWM, I2C
import struct
# ---------------- MOTOR PARAMETERS ----------------
# X direction
STEPS_PER_REV = 200
MICROSTEP = 16
LEAD = 4  # mm/rev for linear axes
MAX_LINEAR_SPEED_x =   23.3 # mm/s in x 
MAX_LINEAR_SPEED_y=   23.3 # mm/s in y direction
#These are differetn due to different load distrubutions and balls screws
# ---------------- IMU PARAMETERS ----------------
IMU1_ADDR = 0x6A
IMU2_ADDR = 0x6B 
log_file = "imu_log.csv"
log_buffer = []
BUFFER_SIZE = 25  # Log every 25 samples (0.25s at 100 Hz)
# -------- LSM6DSOX REGISTERS --------
CTRL1_XL = 0x10
CTRL2_G  = 0x11
OUTX_L_A = 0x28
# ---------------- A AXIS (ROTARY) ----------------
MAX_RPM_A = 5.5               # max safe motor speed
MAX_DEG_PER_SEC_A = (MAX_RPM_A * 360) / 60  # = deg/sec
# ---------------- ENCODER PARAMETERS ----------------
encoder_pins = [
    (12, 13),   # Encoder 1
    (14, 15),   # Encoder 2
    (32, 33),   # Encoder 3
    (27, 37),   # Encoder 4
    (23, 19),   # Encoder 5 (MOSI, MISO)
    (36, 39),   # Encoder 6 (A0, A1)
]
encoders = []
encoder_counts = [0] * 6
encoder_last = [0] * 6

for a_pin, b_pin in encoder_pins:
    encoders.append((
        Pin(a_pin, Pin.IN, Pin.PULL_UP),
        Pin(b_pin, Pin.IN, Pin.PULL_UP)
    ))

# Initialize last states
for i, (a, b) in enumerate(encoders):
    encoder_last[i] = (a.value() << 1) | b.value()
    
# ---------------- PWM SETUP ----------------
# ESP32 GPIO mapping (adjust if needed)
x_pwm = PWM(Pin(7), freq=1000)
y_pwm = PWM(Pin(8), freq=1000)
a_pwm = PWM(Pin(9), freq=1000)

# Force Stop on startup
x_pwm.duty(0)
y_pwm.duty(0)
a_pwm.duty(0)

PWM_MAX = 1023  # ESP32 default resolution (10-bit)

# ---------------- DIRECTION ----------------
dir_pin = Pin(10, Pin.OUT)
dir_pin.value(0)  # single direction for all axes
i2c = I2C(0, scl=Pin(22), sda=Pin(21), freq=400000)

# -------- INIT IMU --------
def init_imu(addr):
    try:
        # 104 Hz accel, ±4g
        i2c.writeto_mem(addr, CTRL1_XL, bytes([0x4A]))
        # 104 Hz gyro, 2000 dps
        i2c.writeto_mem(addr, CTRL2_G, bytes([0x4C]))
        print("IMU initialized:", hex(addr))
    except:
        print("IMU init failed:", hex(addr))



# ---------------- CONTROL STATE ----------------
run_state = {
    "running": False,
    "paused": False,
    "current_step": 0,

    "trajectory_queue": [],
    "current_traj": 0,

    "loop_enabled": False,
    "loop_count": 1,        # number of times to repeat
    "loop_current": 0       # current loop iteration
}

DT = 0.01  # 100 Hz loop

# ---------------- UTILITY ----------------
def get_encoders():
    return encoder_counts
def update_encoders():
    for i, (a, b) in enumerate(encoders):
        state = (a.value() << 1) | b.value()
        last = encoder_last[i]

        if state != last:
            # Quadrature decoding
            if (last == 0b00 and state == 0b01) or \
               (last == 0b01 and state == 0b11) or \
               (last == 0b11 and state == 0b10) or \
               (last == 0b10 and state == 0b00):
                encoder_counts[i] += 1
            else:
                encoder_counts[i] -= 1

            encoder_last[i] = state
def reset_encoders():
    global encoder_counts, encoder_last

    # Reset counts
    for i in range(len(encoder_counts)):
        encoder_counts[i] = 0

    # Re-sync last states to avoid jump on next update
    for i, (a, b) in enumerate(encoders):
        encoder_last[i] = (a.value() << 1) | b.value()

    print("Encoders reset")
def set_pwm(pwm, value): # Sets a Constant PWM for a spefic axis 
    """Set PWM duty cycle (0.0 - 1.0)"""
    value = max(0.0, min(1.0, value))
    duty = int(value * PWM_MAX)
    pwm.duty(duty)

def clear_trajectories():# Clears the trajectory queue and resets indices. Useful for stopping and resetting the system.
    run_state["trajectory_queue"] = []
    run_state["current_traj"] = 0
    run_state["current_step"] = 0
    run_state["running"] = False
    print("Trajectory queue cleared")

def background_loop(): # Starts a background thread for multitasking the control loop
    def loop():
        control_loop()
    _thread.start_new_thread(loop, ())

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
def init_log():#Start Logging IMU data to a CSV file with headers. Call this once at startup.
    with open(log_file, "w") as f:
        f.write("time,step,vx,vy,va,"
                "imu,ax,ay,az,gx,gy,gz\n")

def flush_log():# Write buffered log data to file. Call this periodically or on stop to ensure data is saved.
    global log_buffer
    if not log_buffer:
        return

    with open(log_file, "a") as f:
        for line in log_buffer:
            f.write(line)

    log_buffer = []
def log_step(t, step, vx, vy, va):# Log control commands and IMU data for each control loop iteration. Call this inside the control loop after setting PWM.
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
def get_queue_status():
    return {
        "queue": [t["name"] for t in run_state["trajectory_queue"]],
        "current_traj": run_state["current_traj"],
        "loop_count": run_state["loop_count"],
        "loop_current": run_state["loop_current"]
    }
# ---------------- TRAJECTORY LOADING ----------------
def load_trajectory(file_path):
    traj = []

    try:
        with open(file_path, "r") as f:
            lines = f.readlines()

        for line in lines[1:]:
            parts = line.strip().split(",")

            if len(parts) < 3:
                continue

            try:
                vx = float(parts[0])
                vy = float(parts[1])
                va = float(parts[2])
                traj.append((vx, vy, va))
            except:
                continue

        run_state["trajectory_queue"].append({
            "name": file_path,
            "data": traj
        })

        print("Loaded:", file_path)

    except OSError:
        print("File not found")
# ---------------- USER COMMANDS ----------------
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
    run_state["current_step"] = 0
    run_state["current_traj"] = 0

    set_pwm(x_pwm, 0)
    set_pwm(y_pwm, 0)
    set_pwm(a_pwm, 0)

    flush_log()  # keep your logging safe

    print("Stopped")

def pause(): # Pauses the control loop but keeps the current trajectory and step. 
    #You can resume from the same point with resume()
    if run_state["running"]:
        run_state["paused"] = True
        print("Paused")


def resume():# Resumes the control loop from a paused state.
    if run_state["running"]:
        run_state["paused"] = False
        print("Resumed")

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

    while True: 

        if not run_state["running"]:
            set_pwm(x_pwm, 0)
            set_pwm(y_pwm, 0)
            set_pwm(a_pwm, 0)
            time.sleep_ms(1)
            continue

        if run_state["paused"]:
            set_pwm(x_pwm, 0)
            set_pwm(y_pwm, 0)
            set_pwm(a_pwm, 0)
            time.sleep_ms(1)
            continue

        loop_start = time.ticks_ms()

        if run_state["running"] and not run_state["paused"]:
            tq = run_state["trajectory_queue"]
            if not tq:
                stop()
                continue
            traj_idx = run_state["current_traj"]
            step_idx = run_state["current_step"]
            current_traj = tq[traj_idx]["data"]
            if step_idx < len(current_traj):
                vx, vy, va = current_traj[step_idx]
                set_pwm(x_pwm, vx)
                set_pwm(y_pwm, vy)
                set_pwm(a_pwm, va)
                log_step(loop_start, step_idx, vx, vy, va)
                run_state["current_step"] += 1
                update_encoders()
            else:
                # Move to next trajectory
                run_state["current_traj"] += 1
                run_state["current_step"] = 0
                reset_encoders()

                # End of queue
        if run_state["current_traj"] >= len(tq):

            if run_state["loop_enabled"]:
                run_state["loop_current"] += 1

                if run_state["loop_current"] < run_state["loop_count"]:
                    run_state["current_traj"] = 0
                    print("Loop iteration:", run_state["loop_current"])
                    
                else:
                    print("All loops complete")
                    stop()
            else:
                print("All trajectories complete")
                stop()

        # -------- TIMING --------
        elapsed = time.ticks_diff(time.ticks_ms(), loop_start)
        sleep_ms = int(DT * 1000) - elapsed

        if sleep_ms > 0:
            time.sleep_ms(sleep_ms)
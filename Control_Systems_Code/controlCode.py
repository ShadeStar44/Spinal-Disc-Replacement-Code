#  main.py (MicroPython ESP32 version)

import time
import _thread
from machine import Pin, PWM

# ---------------- MOTOR PARAMETERS ----------------
STEPS_PER_REV = 200
MICROSTEP = 16
LEAD = 4  # mm/rev for linear axes
MAX_LINEAR_SPEED =   23.3 # mm/s
# ---------------- PWM SETUP ----------------
# ESP32 GPIO mapping (adjust if needed)
x_pwm = PWM(Pin(14), freq=1000)
y_pwm = PWM(Pin(15), freq=1000)
a_pwm = PWM(Pin(16), freq=1000)

# Force Stop on startup
x_pwm.duty(0)
y_pwm.duty(0)
a_pwm.duty(0)

PWM_MAX = 1023  # ESP32 default resolution (10-bit)

# ---------------- DIRECTION ----------------
dir_pin = Pin(4, Pin.OUT)
dir_pin.value(0)  # single direction for all axes

# ---------------- CONTROL STATE ----------------
run_state = {
    "running": False,
    "paused": False,
    "current_step": 0,
    "trajectory": ["motionFile.bin"]
}

DT = 0.01  # 100 Hz loop

# ---------------- UTILITY ----------------
def set_pwm(pwm, value):
    """Set PWM duty cycle (0.0 - 1.0)"""
    value = max(0.0, min(1.0, value))
    duty = int(value * PWM_MAX)
    pwm.duty(duty)

def background_loop():
    def loop():
        control_loop()
    _thread.start_new_thread(loop, ())
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

        run_state["trajectory"] = traj
        run_state["current_step"] = 0

        print("Loaded:", len(traj))

    except OSError:
        print("File not found")


# ---------------- USER COMMANDS ----------------
def start():
    run_state["running"] = True
    run_state["paused"] = False
    print("Started")


def stop():
    run_state["running"] = False
    run_state["paused"] = False
    run_state["current_step"] = 0

    set_pwm(x_pwm, 0)
    set_pwm(y_pwm, 0)
    set_pwm(a_pwm, 0)

    print("Stopped")


def pause():
    if run_state["running"]:
        run_state["paused"] = True
        print("Paused")


def resume():
    if run_state["running"]:
        run_state["paused"] = False
        print("Resumed")


# ---------------- MANUAL JOG ----------------
def move_axis(axis, direction, distance_mm):

    if distance_mm < 0.1:
        print("Minimum move is 0.1 mm")
        return

    speed = 20  # mm/sec (choose a stable value)

    duty = speed / MAX_LINEAR_SPEED
    move_time = distance_mm / speed

    dir_pin.value(1 if direction > 0 else 0)

    if axis == 'x':
        set_pwm(x_pwm, duty)
    elif axis == 'y':
        set_pwm(y_pwm, duty)
    elif axis == 'a':
        set_pwm(a_pwm, duty)
    else:
        print("Invalid axis")
        return

    start = time.ticks_ms()

    #precise timing loop (instead of sleep)
    while time.ticks_diff(time.ticks_ms(), start) < int(move_time * 1000):
        time.sleep_ms(1)
    # stop
    set_pwm(x_pwm, 0)
    set_pwm(y_pwm, 0)
    set_pwm(a_pwm, 0)


# ---------------- CONTROL LOOP ----------------
def control_loop():

        # IMMEDIATE STOP CHECK (top priority)
        if not run_state["running"]:
            set_pwm(x_pwm, 0)
            set_pwm(y_pwm, 0)
            set_pwm(a_pwm, 0)
            time.sleep_ms(1)

        if run_state["paused"]:
            set_pwm(x_pwm, 0)
            set_pwm(y_pwm, 0)
            set_pwm(a_pwm, 0)
            time.sleep_ms(1)
        loop_start = time.ticks_ms()

        if run_state["running"] == True and not run_state["paused"] == True:
            idx = run_state["current_step"]
            traj = run_state["trajectory"]

            if idx < len(traj):
                vx, vy, _, va, direction = traj[idx]

                set_pwm(x_pwm, vx)
                set_pwm(y_pwm, vy)
                set_pwm(a_pwm, va)

                run_state["current_step"] += 1

            else:
                print("Trajectory complete")
                stop()

        # fixed timestep (safe version)
        elapsed = time.ticks_diff(time.ticks_ms(), loop_start)
        sleep_ms = int(DT * 1000) - elapsed

        if sleep_ms > 0:
            time.sleep_ms(sleep_ms)
# main.py

import time
import pwmio
import digitalio
import board
import csv

# ---------------- PWM SETUP ----------------
x_pwm = pwmio.PWMOut(board.D14, frequency=1000, duty_cycle=0)
y_pwm = pwmio.PWMOut(board.D15, frequency=1000, duty_cycle=0)
a_pwm = pwmio.PWMOut(board.D16, frequency=1000, duty_cycle=0)

# ---------------- DIRECTION ----------------
dir_pin = digitalio.DigitalInOut(board.D18)
dir_pin.direction = digitalio.Direction.OUTPUT
dir_pin.value = True  # single direction for all axes

# ---------------- CONTROL STATE ----------------
run_state = {
    "running": False,
    "paused": False,
    "current_step": 0,
    "trajectory": []
}

DT = 0.01  # 100 Hz control loop

# ---------------- UTILITY ----------------
def set_pwm(pwm, value):
    """Set PWM duty cycle 0-1"""
    value = max(0.0, min(1.0, value))
    pwm.duty_cycle = int(value * 65535)

def load_trajectory(file_path):
    """Load trajectory CSV: vx, vy, va normalized 0-1"""
    traj = []
    with open(file_path, "r") as f:
        reader = csv.DictReader(f)
        for row in reader:
            try:
                vx = float(row["vx"])
                vy = float(row["vy"])
                va = float(row["va"])
                traj.append((vx, vy, va))
            except:
                continue
    run_state["trajectory"] = traj
    run_state["current_step"] = 0
    print(f"Loaded {len(traj)} steps.")

# ---------------- USER COMMANDS ----------------
def start():
    run_state["running"] = True
    run_state["paused"] = False
    print("Trajectory started.")

def stop():
    run_state["running"] = False
    run_state["paused"] = False
    run_state["current_step"] = 0
    set_pwm(x_pwm, 0)
    set_pwm(y_pwm, 0)
    set_pwm(a_pwm, 0)
    print("Trajectory stopped and reset.")

def pause():
    if run_state["running"]:
        run_state["paused"] = True
        print("Trajectory paused.")

def resume():
    if run_state["running"] and run_state["paused"]:
        run_state["paused"] = False
        print("Trajectory resumed.")

# ---------------- MANUAL JOG ----------------
# axis = 'x','y','a', direction = 1 or -1, distance in mm
def move_axis(axis, direction, distance_mm):
    if distance_mm < 0.1:
        print("Minimum move is 0.1 mm")
        return
    duty = min(distance_mm / 10, 1.0)  # normalize for PWM (example scaling)
    if axis == 'x':
        set_pwm(x_pwm, duty if direction > 0 else 0)
    elif axis == 'y':
        set_pwm(y_pwm, duty if direction > 0 else 0)
    elif axis == 'a':
        set_pwm(a_pwm, duty if direction > 0 else 0)
    else:
        print("Invalid axis. Use 'x','y','a'")
        return
    print(f"Moved axis {axis} {'+' if direction>0 else '-'}{distance_mm} mm")
    time.sleep(distance_mm / 50)  # crude timing for movement
    set_pwm(x_pwm, 0)
    set_pwm(y_pwm, 0)
    set_pwm(a_pwm, 0)

# ---------------- CONTROL LOOP ----------------
def control_loop():
    while True:
        start_time = time.monotonic()

        if run_state["running"] and not run_state["paused"]:
            traj = run_state["trajectory"]
            idx = run_state["current_step"]

            if idx < len(traj):
                vx, vy, va = traj[idx]
                set_pwm(x_pwm, vx)
                set_pwm(y_pwm, vy)
                set_pwm(a_pwm, va)
                run_state["current_step"] += 1
            else:
                # finished
                print("Trajectory complete")
                stop()

        # fixed timestep
        elapsed = time.monotonic() - start_time
        sleep_time = DT - elapsed
        if sleep_time > 0:
            time.sleep(sleep_time)
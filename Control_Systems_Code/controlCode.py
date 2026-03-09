import machine
import time
import csv

# -------------------- STEP/DIR Pins --------------------
STEP_PINS = {"X": 14, "Y": 15, "UR1": 16, "UR2": 17}
DIR_PINS = {"X": 18, "Y": 19, "UR1": 20, "UR2": 21}

step_pins = {axis: machine.Pin(pin, machine.Pin.OUT) for axis, pin in STEP_PINS.items()}
dir_pins = {axis: machine.Pin(pin, machine.Pin.OUT) for axis, pin in DIR_PINS.items()}

# -------------------- Encoder Reading --------------------
# Placeholder: implement based on your encoders
ENCODER_COUNTS = {"X": 0, "Y": 0, "UR1": 0, "UR2": 0}

def read_encoder(axis):
    # Return current step count for axis
    return ENCODER_COUNTS[axis]

def update_encoder(axis, steps):
    # Update simulated encoder value
    ENCODER_COUNTS[axis] += steps

# -------------------- PID Parameters --------------------
PID_PARAMS = {
    "X": {"Kp": 1.0, "Ki": 0.0, "Kd": 0.0},
    "Y": {"Kp": 1.0, "Ki": 0.0, "Kd": 0.0},
    "UR1": {"Kp": 1.0, "Ki": 0.0, "Kd": 0.0},
    "UR2": {"Kp": 1.0, "Ki": 0.0, "Kd": 0.0}
}

pid_state = {axis: {"integral":0.0, "prev_error":0.0} for axis in STEP_PINS}

# -------------------- Helper Functions --------------------
def move_step(axis, steps):
    direction = 1 if steps >= 0 else 0
    dir_pins[axis].value(direction)
    for _ in range(abs(steps)):
        step_pins[axis].value(1)
        time.sleep_us(500)
        step_pins[axis].value(0)
        time.sleep_us(500)
        update_encoder(axis, 1 if direction else -1)

def pid_control(axis, target, current, dt):
    error = target - current
    pid_state[axis]["integral"] += error * dt
    derivative = (error - pid_state[axis]["prev_error"]) / dt
    pid_state[axis]["prev_error"] = error
    output = PID_PARAMS[axis]["Kp"]*error + PID_PARAMS[axis]["Ki"]*pid_state[axis]["integral"] + PID_PARAMS[axis]["Kd"]*derivative
    return int(round(output))

# -------------------- Load CSV --------------------
CSV_FILE = "motion.csv"  # Put on Feather filesystem
trajectory = []
with open(CSV_FILE, "r") as f:
    reader = csv.DictReader(f)
    for row in reader:
        trajectory.append({
            "time": float(row["Time"]),
            "X": int(row["X (U1)"]),
            "Y": int(row["Y (U2)"]),
            "UR1": int(row["UR1"]),
            "UR2": int(row["UR2"])
        })

# -------------------- Motion Loop --------------------
prev_point = trajectory[0]
# Move to initial positions
for axis in ["X","Y","UR1","UR2"]:
    move_step(axis, prev_point[axis])

for point in trajectory[1:]:
    dt = point["time"] - prev_point["time"]
    if dt <= 0:
        dt = 0.001

    for axis in ["X","Y","UR1","UR2"]:
        current_steps = read_encoder(axis)
        target_steps = point[axis]
        delta_steps = pid_control(axis, target_steps, current_steps, dt)
        move_step(axis, delta_steps)

    time.sleep(dt)
    prev_point = point

print("Trajectory complete!")
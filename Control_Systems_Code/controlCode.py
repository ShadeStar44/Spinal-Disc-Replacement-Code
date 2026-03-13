import board
import busio
import digitalio
import time
import csv

from adafruit_bno08x.i2c import BNO08X_I2C
from adafruit_bno08x import (
    BNO_REPORT_ACCELEROMETER,
    BNO_REPORT_GYROSCOPE,
    BNO_REPORT_ROTATION_VECTOR,
)

# ---------------- STEP PINS ----------------
step_x = digitalio.DigitalInOut(board.D14)
step_x.direction = digitalio.Direction.OUTPUT

step_y = digitalio.DigitalInOut(board.D15)
step_y.direction = digitalio.Direction.OUTPUT

step_a = digitalio.DigitalInOut(board.D16)
step_a.direction = digitalio.Direction.OUTPUT

# ---------------- DIRECTION PIN ----------------
dir_pin = digitalio.DigitalInOut(board.D18)
dir_pin.direction = digitalio.Direction.OUTPUT
dir_pin.value = True   # all motors same direction

# ---------------- I2C IMU SETUP ----------------
i2c = busio.I2C(board.SCL, board.SDA)

imu = BNO08X_I2C(i2c)

imu.enable_feature(BNO_REPORT_ACCELEROMETER)
imu.enable_feature(BNO_REPORT_GYROSCOPE)
imu.enable_feature(BNO_REPORT_ROTATION_VECTOR)

print("IMU initialized")

# ---------------- CSV FILES ----------------
motion_file = "/Test1.csv"
log_file = "/motion_imu_log.csv"

# create log file
with open(log_file, "w") as f:
    writer = csv.writer(f)
    writer.writerow([
        "timestamp",
        "X_pulse","Y_pulse","A_pulse",
        "ax","ay","az",
        "gx","gy","gz",
        "qx","qy","qz","qw"
    ])

# ---------------- STEP FUNCTION ----------------
def pulse(pin):
    pin.value = True
    time.sleep_us(400)
    pin.value = False
    time.sleep_us(400)

# ---------------- LOAD TRAJECTORY ----------------
trajectory = []

with open(motion_file) as f:
    reader = csv.DictReader(f)

    for row in reader:
        trajectory.append([
            int(row["dx_steps"]),
            int(row["dy_steps"]),
            int(row["da_steps"])
        ])

print("Trajectory loaded:", len(trajectory))

# ---------------- EXECUTION LOOP ----------------
start_time = time.monotonic()

for step in trajectory:

    Xp, Yp, Ap = step

    # send pulses
    if Xp:
        pulse(step_x)

    if Yp:
        pulse(step_y)

    if Ap:
        pulse(step_a)

    # read IMU
    ax, ay, az = imu.acceleration
    gx, gy, gz = imu.gyro
    qx, qy, qz, qw = imu.quaternion

    timestamp = time.monotonic() - start_time

    # log data
    with open(log_file, "a") as f:
        writer = csv.writer(f)
        writer.writerow([
            timestamp,
            Xp, Yp, Ap,
            ax, ay, az,
            gx, gy, gz,
            qx, qy, qz, qw
        ])

print("Motion complete")
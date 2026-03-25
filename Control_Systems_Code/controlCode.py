import board
import busio
import digitalio
import time
import csv
import pwmio

from adafruit_bno08x.i2c import BNO08X_I2C
from adafruit_bno08x import (
    BNO_REPORT_ACCELEROMETER,
    BNO_REPORT_GYROSCOPE,
    BNO_REPORT_ROTATION_VECTOR,
)

# ---------------- PWM OUTPUTS ----------------
# 1 kHz PWM for analog converter modules
x_pwm = pwmio.PWMOut(board.D14, frequency=1000, duty_cycle=0)
y_pwm = pwmio.PWMOut(board.D15, frequency=1000, duty_cycle=0)
a_pwm = pwmio.PWMOut(board.D16, frequency=1000, duty_cycle=0)

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
        "vx","vy","va",
        "ax","ay","az",
        "gx","gy","gz",
        "qx","qy","qz","qw"
    ])

# ---------------- PWM HELPER ----------------
def set_pwm(pwm, value):
    """
    value: 0.0 to 1.0 (normalized speed)
    """
    value = max(0.0, min(1.0, value))  # clamp
    pwm.duty_cycle = int(value * 65535)

# ---------------- LOAD TRAJECTORY ----------------
trajectory = []

with open(motion_file) as f:
    reader = csv.DictReader(f)

    for row in reader:
        trajectory.append([
            float(row["vx"]),   # normalized 0–1
            float(row["vy"]),
            float(row["va"])
        ])

print("Trajectory loaded:", len(trajectory))

# ---------------- EXECUTION LOOP ----------------
start_time = time.monotonic()

for step in trajectory:

    vx, vy, va = step

    # apply PWM speeds
    set_pwm(x_pwm, vx)
    set_pwm(y_pwm, vy)
    set_pwm(a_pwm, va)

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
            vx, vy, va,
            ax, ay, az,
            gx, gy, gz,
            qx, qy, qz, qw
        ])

    time.sleep(0.01)  # control update rate (100 Hz)

# stop motors
set_pwm(x_pwm, 0)
set_pwm(y_pwm, 0)
set_pwm(a_pwm, 0)

print("Motion complete")
import tkinter as tk
from tkinter import filedialog
import pandas as pd
import numpy as np
import struct

# ---------------- SETTINGS ----------------
angular_speed = 5  # deg/sec
DT = 0.01

RAMP_TIME = 0.5

MAX_PWM = 65535
MAX_LINEAR_SPEED = 50
MAX_ANGULAR_SPEED = 10

xCol = "X (U1)"
yCol = "Y (U2)"
zCol = "Z (U3)"
angleCol = "Angle"

# ---------------- LOAD ----------------
file_path = filedialog.askopenfilename()
data = pd.read_csv(file_path)

angle = data[angleCol].values
x = data[xCol].values
y = data[yCol].values
z = data[zCol].values

# ---------------- INTERPOLATION ----------------
x_func = lambda a: np.interp(a, angle, x)
y_func = lambda a: np.interp(a, angle, y)
z_func = lambda a: np.interp(a, angle, z)

# ---------------- S CURVE ----------------
def s_curve(t):
    return 3*t**2 - 2*t**3

# ---------------- TIME SETUP ----------------
theta_start = angle[0]
theta_end = angle[-1]
total_angle = theta_end - theta_start

total_time = total_angle / angular_speed

ramp_steps = int(RAMP_TIME / DT)
total_steps = int(total_time / DT)

motion_segments = []

theta = theta_start

def to_pwm(v, max_v):
    return int(min(abs(v) / max_v, 1.0) * MAX_PWM)

# ---------------- MAIN MOTION ----------------
for i in range(total_steps):

    if i < ramp_steps:
        scale = s_curve(i / ramp_steps)
    elif i > total_steps - ramp_steps:
        scale = s_curve((total_steps - i) / ramp_steps)
    else:
        scale = 1.0

    omega = angular_speed * scale
    theta_next = theta + omega * DT

    x1 = x_func(theta)
    y1 = y_func(theta)
    z1 = z_func(theta)

    x2 = x_func(theta_next)
    y2 = y_func(theta_next)
    z2 = z_func(theta_next)

    vx = (x2 - x1) / DT
    vy = (y2 - y1) / DT
    vz = (z2 - z1) / DT
    va = omega

    direction = 0 if omega >= 0 else 1

    motion_segments.append((vx, vy, vz, va, direction))

    theta = theta_next

# ---------------- RETURN MOTION ----------------
print("Adding return motion...")

return_steps = int(total_time / DT)
theta_return = theta

for i in range(return_steps):

    if i < ramp_steps:
        scale = s_curve(i / ramp_steps)
    elif i > return_steps - ramp_steps:
        scale = s_curve((return_steps - i) / ramp_steps)
    else:
        scale = 1.0

    omega = -angular_speed * scale
    theta_next = theta_return + omega * DT

    x1 = x_func(theta_return)
    y1 = y_func(theta_return)
    z1 = z_func(theta_return)

    x2 = x_func(theta_next)
    y2 = y_func(theta_next)
    z2 = z_func(theta_next)

    vx = (x2 - x1) / DT
    vy = (y2 - y1) / DT
    vz = (z2 - z1) / DT
    va = omega

    direction = 1 if omega >= 0 else 0

    motion_segments.append((vx, vy, vz, va, direction))

    theta_return = theta_next

# ---------------- SAVE BINARY ----------------
save_path = filedialog.asksaveasfilename(defaultextension=".bin")

with open(save_path, "wb") as f:
    for vx, vy, vz, va, d in motion_segments:
        f.write(struct.pack("<ffffB", vx, vy, vz, va, d))

print("Saved binary motion file")
print("Steps:", len(motion_segments))
print("Bytes:", len(motion_segments) * 17)
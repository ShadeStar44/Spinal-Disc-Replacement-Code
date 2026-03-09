import tkinter as tk
from tkinter import filedialog
import pandas as pd
import numpy as np

# ---------------- Motor configuration ----------------
STEPS_PER_REV = 200
MICROSTEP = 16
LEAD = 4  # mm/rev for linear axes

STEPS_PER_REV_EFFECTIVE = STEPS_PER_REV * MICROSTEP
LINEAR_STEPS_PER_MM = STEPS_PER_REV_EFFECTIVE / LEAD
ANG_STEPS_PER_DEG = STEPS_PER_REV_EFFECTIVE / 360

# Rotational torque limit
TARGET_TORQUE = 1.0       # Nm
MOMENT_OF_INERTIA = 0.01  # kg·m²
ALPHA_MAX = TARGET_TORQUE / MOMENT_OF_INERTIA  # rad/s²

# Desired motion duration
TOTAL_DURATION = 30.0  # seconds
RETURN_DURATION = 5.0  # seconds to return to home

# ---------------- Conversion functions ----------------
def linear_steps(x):
    return int(round(x * LINEAR_STEPS_PER_MM))

def rad_to_steps(x):
    deg = np.degrees(x)
    return int(round(deg * ANG_STEPS_PER_DEG))

# ---------------- Tkinter Setup ----------------
root = tk.Tk()
root.withdraw()

# ---------------- File Selection ----------------
file_path = filedialog.askopenfilename(
    title="Select Abaqus trajectory file",
    filetypes=[("CSV files","*.csv"),("All files","*.*")]
)

if file_path:

    df = pd.read_csv(file_path)
    data = df.copy()

    # ---------------- Rescale timestamps ----------------
    t0 = data["Time"].iloc[0]
    t_end = data["Time"].iloc[-1]
    original_duration = t_end - t0 if t_end - t0 > 0 else 1e-6
    data["Time"] = ((data["Time"] - t0) / original_duration) * TOTAL_DURATION

    # ---------------- Linear axes ----------------
    linear_axes = ["X (U1)", "Y (U2)"]
    for col in linear_axes:
        if col in data.columns:
            data[col] = data[col].apply(linear_steps)

    # ---------------- Rotational axes ----------------
    rotational_axes = ["UR1", "UR2"]
    for col in rotational_axes:
        if col in data.columns:
            steps_list = []
            prev_steps = rad_to_steps(data[col].iloc[0])
            prev_time = data["Time"].iloc[0]
            steps_list.append(prev_steps)

            for idx in range(1, len(data)):
                t = data["Time"].iloc[idx]
                dt = t - prev_time
                if dt <= 0:
                    dt = 1e-6

                # max allowed angular change (rad)
                dtheta_max = ALPHA_MAX * dt
                max_delta_steps = rad_to_steps(dtheta_max)

                desired_steps = rad_to_steps(data[col].iloc[idx])
                delta_steps = desired_steps - prev_steps

                # Clip to torque-based delta
                if delta_steps > max_delta_steps:
                    delta_steps = max_delta_steps
                elif delta_steps < -max_delta_steps:
                    delta_steps = -max_delta_steps

                new_steps = prev_steps + delta_steps
                steps_list.append(new_steps)
                prev_steps = new_steps
                prev_time = t

            data[col] = steps_list
            data[col + "_torque_Nm"] = TARGET_TORQUE

    # ---------------- Append Return-to-Home ----------------
    # Copy first row to return to home
    home_row = data.iloc[0].copy()
    last_time = data["Time"].iloc[-1]
    home_row["Time"] = last_time + RETURN_DURATION  # return over 5 seconds
    data = pd.concat([data, home_row.to_frame().T], ignore_index=True)

    # ---------------- Save Output ----------------
    save_path = filedialog.asksaveasfilename(
        title="Save converted file",
        defaultextension=".csv",
        filetypes=[("CSV files","*.csv"),("All files","*.*")]
    )

    if save_path:
        data.to_csv(save_path, index=False)
        print("Conversion complete! File saved at:", save_path)
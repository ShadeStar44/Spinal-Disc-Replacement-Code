import tkinter as tk
from tkinter import filedialog
import pandas as pd
import numpy as np

# ---------------- USER SETTINGS ----------------
angular_speed = 5  # deg/sec

xCol = "X (U1)"
yCol = "Y (U2)"
zCol = "Z (U3)"
angleCol = "Angle"

# mechanical constants
lead = 4
steps_per_rev = 200
steps_per_mm = steps_per_rev / lead
steps_per_deg = 1 / 1.8

# ---------------- FILE DIALOG ----------------
def open_file():
    return filedialog.askopenfilename(
        title="Select Abaqus trajectory file",
        filetypes=[("CSV files","*.csv"),("All files","*.*")]
    )

def save_file():
    return filedialog.asksaveasfilename(
        title="Save motion file",
        defaultextension=".csv"
    )

# ---------------- LOAD DATA ----------------
file_path = open_file()

data = pd.read_csv(file_path)

print("Detected columns:", data.columns.tolist())

# ---------------- POSITION DIFFERENCES ----------------
dx = data[xCol].diff().fillna(0)
dy = data[yCol].diff().fillna(0)
dz = data[zCol].diff().fillna(0)
da = data[angleCol].diff().fillna(0)

# ---------------- CONVERT TO STEPS ----------------
sx = dx * steps_per_mm
sy = dy * steps_per_mm
sz = dz * steps_per_mm
sa = da * steps_per_deg

# ---------------- TIME FROM ANGULAR SPEED ----------------
segment_time = abs(da) / angular_speed
segment_time.replace(0, np.nan, inplace=True)
segment_time = segment_time.bfill()

# ---------------- FRACTIONAL STEP ACCUMULATION ----------------
accX = accY = accZ = accA = 0

motion_segments = []

for i in range(len(data)):

    accX += sx.iloc[i]
    accY += sy.iloc[i]
    accZ += sz.iloc[i]
    accA += sa.iloc[i]

    stepX = int(accX)
    stepY = int(accY)
    stepZ = int(accZ)
    stepA = int(accA)

    accX -= stepX
    accY -= stepY
    accZ -= stepZ
    accA -= stepA

    if stepX == 0 and stepY == 0 and stepZ == 0 and stepA == 0:
        continue

    motion_segments.append([
        stepX,
        stepY,
        stepZ,
        stepA,
        segment_time.iloc[i]
    ])

# ---------------- SAVE OUTPUT ----------------
traj_df = pd.DataFrame(
    motion_segments,
    columns=[
        "dx_steps",
        "dy_steps",
        "dz_steps",
        "da_steps",
        "segment_time"
    ]
)

save_path = save_file()

traj_df.to_csv(save_path,index=False)

print("Motion file saved:", save_path)
print("Segments generated:", len(traj_df))
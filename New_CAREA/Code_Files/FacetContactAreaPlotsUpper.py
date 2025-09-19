import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import itertools
import tkinter as tk
from tkinter import filedialog
#TEst change

# =====================
# Description
# =====================
# This script reads an Excel file containing facet contact area data, and plot said data.
# Specfically it is ploting data for the Upper facets both left() and right
# =====================
# File Selection
# =====================
root = tk.Tk()
root.withdraw()  # Hide Tkinter root window
file_path = filedialog.askopenfilename(
    title="Select an Excel file",
    filetypes=[("Excel files", "*.xlsx *.xls")]
)

if not file_path:
    raise FileNotFoundError("No file selected!")

print("Selected file:", file_path)

# =====================
# Load Facet Labels (row 4 of Excel)
# =====================
df_all = pd.read_excel(file_path, sheet_name="Sheet1", header=None)
facet_labels = df_all.iloc[2].dropna().tolist()  # row 4 (index=2 in zero-based)
print("Facet labels found:", facet_labels)

# =====================
# Load Data (skip first 4 rows)
# =====================
df_data = pd.read_excel(file_path, sheet_name="Sheet1", skiprows=4)

# Build dictionary
data = {}
for i, label in enumerate(facet_labels):
    cols = df_data.iloc[:, i*3:(i+1)*3]
    if cols.shape[1] == 3:
        data[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "moment": cols.iloc[:, 1].to_numpy(),
            "CAREA": cols.iloc[:, 2].to_numpy()
        }

# =====================
# Plotting Functions
# =====================
def plot_facet(data, left_label, right_label, left_color, right_color):
    left_xn = -1 * data[left_label]["moment"] + 2
    left_yp = data[left_label]["CAREA"]

    right_xn = -1 * data[right_label]["moment"] + 2
    right_yp = data[right_label]["CAREA"]

    left_xl = 2 * np.concatenate((np.flip(left_xn[1:21]), left_yp))
    left_yl = np.concatenate((np.flip(left_yp[1:21]), left_yp))
    p_left, = plt.plot(left_xl, left_yl, color=left_color, label=left_label)

    right_xr = 2 * np.concatenate((np.flip(right_xn[1:21]), right_yp))
    right_yr = np.concatenate((np.flip(right_yp[1:21]), right_yp))
    p_right, = plt.plot(right_xr, right_yr, linestyle='-.', color=right_color, label=right_label)

    return p_left, p_right

def group_facets(labels):
    pairs = []
    for l in labels:
        if l.endswith("UL"):
            base = l[:-2]
            r = base + "UR"
            if r in labels:
                pairs.append((l, r))
        elif l.endswith("LL"):
            base = l[:-2]
            r = base + "LR"
            if r in labels:
                pairs.append((l, r))
    return pairs

# =====================
# Plot All Facet Pairs
# =====================
plt.figure(figsize=(10, 7))

colors = itertools.cycle(['r', 'g', 'b', 'c', 'm', 'y', 'k'])
handles = []

pairs = group_facets(list(data.keys()))
for left, right in pairs:
    color = next(colors)
    p_left, p_right = plot_facet(data, left, right, color, color)
    handles.extend([p_left, p_right])

plt.title('Facet Contact Area (CAREA) under extension/flexion (4N/4P)')
plt.xlabel('Moment (N-m)')
plt.ylabel('Area (mm^2)')
plt.legend(handles=handles, loc='lower center', ncol=4)
plt.show()

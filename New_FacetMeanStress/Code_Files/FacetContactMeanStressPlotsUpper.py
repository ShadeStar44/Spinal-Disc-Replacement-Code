import pandas as pd
import numpy as np
import matplotlib as plt
import itertools
import tkinter as tk
from tkinter import filedialog

#Data reading

root = tk.Tk()
root.withdraw()  # Hide Tkinter root window
file_path = filedialog.askopenfilename(
    title="Select an Excel file",
    filetypes=[("Excel files", "*.xlsx *.xls")]
)

if not file_path:
    raise FileNotFoundError("No file selected!")

print("Selected file:", file_path)

df_all = pd.read_excel(file_path, sheet_name="Sheet1", header=None)
facet_labels = df_all.iloc[2].dropna().tolist()  # row 4 (index=2 in zero-based)
print("Facet labels found:", facet_labels)

df_data = pd.read_excel(file_path, sheet_name="Sheet1", skiprows=4)

# Build dictionary
data = {}
for i, label in enumerate(facet_labels):
    cols = df_data.iloc[:, i*5:(i+1)*5]
    if cols.shape[1] == 5:
        data[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "moment": cols.iloc[:, 1].to_numpy(),
            "CAREA": cols.iloc[:, 2].to_numpy(),
            "CFNM": cols.iloc[:,3].to_numpy(),
            "FMS": cols.iloc[:,4].to_numpy(),
        }




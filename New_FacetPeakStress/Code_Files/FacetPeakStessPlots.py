import pandas as pd
import numpy as np
import matplotlib as plt
import itertools
import tkinter as tk
from tkinter import filedialog


#Data reading / File Selection

root = tk.Tk()
root.withdraw()  # Hide Tkinter root window
file_path = filedialog.askopenfilename(
    title="Select an Excel file",
    filetypes=[("Excel files", "*.xlsx *.xls")]
)

if not file_path:
    raise FileNotFoundError("No file selected!")

print("Selected file:", file_path)


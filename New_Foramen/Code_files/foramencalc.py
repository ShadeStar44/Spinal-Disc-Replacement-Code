import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import itertools
import tkinter as tk
from tkinter import filedialog
from pathlib import Path


def read_file(model):

    data_path = (f'New_Foramen/Data Files/Model {model} Foramen.xlsx')
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None)
    #Get node labels
    node_labels = df_all.iloc[2].dropna().tolist()
    print("Node Labels Found:", node_labels) 

    
    orig_coords = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[3, i*5: (i+1) *5]
        orig_coords[label] = {
            "x_val": float(cols.iloc[1]),
            "y_val": float(cols.iloc[2]),
            "z_val": float(cols.iloc[3])
        }

    print("Orig Coordinates Found:", orig_coords)

    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None, skiprows = 5)
    data_4n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_4n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:,1].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
            
        } 
        data_4n[label]["x_vals"] = orig_coords[label]["x_val"] + data_4n[label]["x_vals"]
        data_4n[label]["y_vals"] = orig_coords[label]["y_val"] + data_4n[label]["y_vals"]
        data_4n[label]["z_vals"] = orig_coords[label]["z_val"] + data_4n[label]["z_vals"]
    
    
    #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="4P", header=None, skiprows = 5)
    data_4p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5]
        data_4p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:,1].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_4p[label]["x_vals"] = orig_coords[label]["x_val"] + data_4p[label]["x_vals"]
        data_4p[label]["y_vals"] = orig_coords[label]["y_val"] + data_4p[label]["y_vals"]
        data_4p[label]["z_vals"] = orig_coords[label]["z_val"] + data_4p[label]["z_vals"]

    df_all = pd.read_excel(data_path, sheet_name="5N", header=None, skiprows = 5)
    data_5n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_5n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:,1].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_5n[label]["x_vals"] = orig_coords[label]["x_val"] + data_5n[label]["x_vals"]
        data_5n[label]["y_vals"] = orig_coords[label]["y_val"] + data_5n[label]["y_vals"]
        data_5n[label]["z_vals"] = orig_coords[label]["z_val"] + data_5n[label]["z_vals"]


    df_all = pd.read_excel(data_path, sheet_name="5P", header=None, skiprows = 5)
    data_5p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5]
        data_5p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:,1].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_5p[label]["x_vals"] = orig_coords[label]["x_val"] + data_5p[label]["x_vals"]
        data_5p[label]["y_vals"] = orig_coords[label]["y_val"] + data_5p[label]["y_vals"]
        data_5p[label]["z_vals"] = orig_coords[label]["z_val"] + data_5p[label]["z_vals"]

    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="6N", header=None, skiprows = 5)
    data_6n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_6n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:,1].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_6n[label]["x_vals"] = orig_coords[label]["x_val"] + data_6n[label]["x_vals"]
        data_6n[label]["y_vals"] = orig_coords[label]["y_val"] + data_6n[label]["y_vals"]
        data_6n[label]["z_vals"] = orig_coords[label]["z_val"] + data_6n[label]["z_vals"]

    df_all = pd.read_excel(data_path, sheet_name="6P", header=None, skiprows = 5)
    data_6p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5]
        data_6p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:,1].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_6p[label]["x_vals"] = orig_coords[label]["x_val"] + data_6p[label]["x_vals"]
        data_6p[label]["y_vals"] = orig_coords[label]["y_val"] + data_6p[label]["y_vals"]
        data_6p[label]["z_vals"] = orig_coords[label]["z_val"] + data_6p[label]["z_vals"]

    print("Data Read Succesfully")
    return data_4n, data_4p, data_5n, data_5p, data_6n, data_6p


def stitch_np(pn, pp):
    """Reverse pn, then append pp without duplicating endpoint"""
    return np.vstack((pn[::-1], pp[1:]))


def inscribe_circle_calc(data_n,data_p, LU, LL, RU, RL):

    p1n = np.column_stack((
        data_n[LU]["x_vals"],
        data_n[LU]["y_vals"],
        data_n[LU]["z_vals"]
    ))
 
    p1p = np.column_stack((
        data_p[LU]["x_vals"],
        data_p[LU]["y_vals"],
        data_p[LU]["z_vals"]
    ))

    p2n = np.column_stack((
        data_n[LL]["x_vals"],
        data_n[LL]["y_vals"],
        data_n[LL]["z_vals"]
    ))

    p2p = np.column_stack((
        data_p[LL]["x_vals"],
        data_p[LL]["y_vals"],
        data_p[LL]["z_vals"]
    ))

    p3n = np.column_stack((
        data_n[RU]["x_vals"],
        data_n[RU]["y_vals"],
        data_n[RU]["z_vals"]
    ))

    p3p = np.column_stack((
        data_p[RU]["x_vals"],
        data_p[RU]["y_vals"],
        data_p[RU]["z_vals"]
    ))

    p4n = np.column_stack((
        data_n[RL]["x_vals"],
        data_n[RL]["y_vals"],
        data_n[RL]["z_vals"]
    ))

    p4p = np.column_stack((
        data_p[RL]["x_vals"],
        data_p[RL]["y_vals"],
        data_p[RL]["z_vals"]
    ))

    p1 = stitch_np(p1n, p1p)
    p2 = stitch_np(p2n, p2p)
    p3 = stitch_np(p3n, p3p)
    p4 = stitch_np(p4n, p4p)

    if not (p1.shape == p2.shape == p3.shape == p4.shape):
        raise ValueError("All inputs must have the same shape (N,3)")

    if p1.shape[1] != 3:
        raise ValueError("Each point must have 3 coordinates")

    N = p1.shape[0]

    areas = np.zeros(N)
    radii = np.zeros(N)
    centers = np.zeros((N, 3))

    for i in range(N):
        P = np.vstack((p1[i], p2[i], p3[i], p4[i]))

        # --- Fit plane ---
        centroid = P.mean(axis=0)
        _, _, Vt = np.linalg.svd(P - centroid)

        u = Vt[0]
        v = Vt[1]

        # --- Project to 2D ---
        x = np.dot(P - centroid, u)
        y = np.dot(P - centroid, v)

        # --- Fit circle in 2D ---
        A = np.column_stack((2*x, 2*y, np.ones(4)))
        b = x**2 + y**2

        cx, cy, c = np.linalg.lstsq(A, b, rcond=None)[0]
        r = np.sqrt(cx**2 + cy**2 + c)

        # --- Convert center to 3D ---
        center3d = centroid + cx*u + cy*v

        # --- Store ---
        radii[i] = r
        areas[i] = np.pi * r**2
        centers[i] = center3d

    return areas, radii, centers 

# --- Intact Model ----

data_4n15, data_4p15, data_5n15, data_5p15, data_6n15, data_6p15 = read_file("15")
t = np.concatenate((-np.flip(data_4n15[14886]["time"]), data_4p15[14886]["time"][1:]))


    #C34
areas4np_15c34L, radii4np_15c34L, centers4np_15c34L = inscribe_circle_calc(data_4n15,data_4p15, 14886, 1297, 16439, 17116)
areas5np_15c34L, radii5np_15c34L, centers5np_15c34L = inscribe_circle_calc(data_5n15,data_5p15, 14886, 1297, 16439, 17116)
areas6np_15c34L, radii6np_15c34L, centers6np_15c34L = inscribe_circle_calc(data_6n15,data_6p15, 14886, 1297, 16439, 17116)

areas4np_15c34R, radii4np_15c34R, centers4np_15c34R = inscribe_circle_calc(data_4n15,data_4p15, 21922, 4457, 20101, 9037)
areas5np_15c34R, radii5np_15c34R, centers5np_15c34R = inscribe_circle_calc(data_5n15,data_5p15, 21922, 4457, 20101, 9037)
areas6np_15c34R, radii6np_15c34R, centers6np_15c34R = inscribe_circle_calc(data_6n15,data_6p15, 21922, 4457, 20101, 9037)

fig15_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_15c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_15c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Intact Model C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_15c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_15c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_15c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_15c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig15_34.savefig(f"New_Foramen/Plots/Model 15/Inscr_for_area_15_c34.jpg", dpi = 300)

    #C45
areas4np_15c45L, radii4np_15c45L, centers4np_15c45L = inscribe_circle_calc(data_4n15,data_4p15, 52345, 16215, 36615, 37435)
areas5np_15c45L, radii5np_15c45L, centers5np_15c45L = inscribe_circle_calc(data_5n15,data_5p15, 52345, 16215, 36615, 37435)
areas6np_15c45L, radii6np_15c45L, centers6np_15c45L = inscribe_circle_calc(data_6n15,data_6p15, 52345, 16215, 36615, 37435)

areas4np_15c45R, radii4np_15c45R, centers4np_15c45R = inscribe_circle_calc(data_4n15,data_4p15, 21792, 20210, 40175, 46036)
areas5np_15c45R, radii5np_15c45R, centers5np_15c45R = inscribe_circle_calc(data_5n15,data_5p15, 21792, 20210, 40175, 46036)
areas6np_15c45R, radii6np_15c45R, centers6np_15c45R = inscribe_circle_calc(data_6n15,data_6p15, 21792, 20210, 40175, 46036)

fig15_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_15c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_15c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Intact Model C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_15c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_15c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_15c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_15c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig15_45.savefig(f"New_Foramen/Plots/Model 15/Inscr_for_area_15_c45.jpg", dpi = 300)

    #C56
areas4np_15c56L, radii4np_15c56L, centers4np_15c56L = inscribe_circle_calc(data_4n15,data_4p15, 52117, 36527, 57675, 58369)
areas5np_15c56L, radii5np_15c56L, centers5np_15c56L = inscribe_circle_calc(data_5n15,data_5p15, 52117, 36527, 57675, 58369)
areas6np_15c56L, radii6np_15c56L, centers6np_15c56L = inscribe_circle_calc(data_6n15,data_6p15, 52117, 36527, 57675, 58369)

areas4np_15c56R, radii4np_15c56R, centers4np_15c56R = inscribe_circle_calc(data_4n15,data_4p15, 65927, 40272, 62515, 79559)
areas5np_15c56R, radii5np_15c56R, centers5np_15c56R = inscribe_circle_calc(data_5n15,data_5p15, 65927, 40272, 62515, 79559)
areas6np_15c56R, radii6np_15c56R, centers6np_15c56R = inscribe_circle_calc(data_6n15,data_6p15, 65927, 40272, 62515, 79559)

fig15_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_15c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_15c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Intact Model C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_15c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_15c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_15c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_15c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig15_56.savefig(f"New_Foramen/Plots/Model 15/Inscr_for_area_15_c56.jpg", dpi = 300)

"""
#-------------------------- Model 1 -------------------------------------------------------
data_4n1, data_4p1, data_5n1, data_5p1, data_6n1, data_6p1 = read_file("1")
t = np.concatenate((-np.flip(data_4n1[14886]["time"]), data_4p1[14886]["time"][1:]))

    #C34
areas4np_1c34L, radii4np_1c34L, centers4np_1c34L = inscribe_circle_calc(data_4n1,data_4p1, 14886, 1297, 16439, 17116)
areas5np_1c34L, radii5np_1c34L, centers5np_1c34L = inscribe_circle_calc(data_5n1,data_5p1, 14886, 1297, 16439, 17116)
areas6np_1c34L, radii6np_1c34L, centers6np_1c34L = inscribe_circle_calc(data_6n1,data_6p1, 14886, 1297, 16439, 17116) 

areas4np_1c34R, radii4np_1c34R, centers4np_1c34R = inscribe_circle_calc(data_4n1,data_4p1, 21922, 4457, 20101, 9037)
areas5np_1c34R, radii5np_1c34R, centers5np_1c34R = inscribe_circle_calc(data_5n1,data_5p1, 21922, 4457, 20101, 9037)
areas6np_1c34R, radii6np_1c34R, centers6np_1c34R = inscribe_circle_calc(data_6n1,data_6p1, 21922, 4457, 20101, 9037)

fig1_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_1c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_1c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 1 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_1c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_1c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_1c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_1c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig1_34.savefig(f"New_Foramen/Plots/Model 1/Inscr_for_area_1_c34.jpg", dpi = 300)

    #C45
areas4np_1c45L, radii4np_1c45L, centers4np_1c45L = inscribe_circle_calc(data_4n1,data_4p1, 52345, 16215, 36615, 37435)
areas5np_1c45L, radii5np_1c45L, centers5np_1c45L = inscribe_circle_calc(data_5n1,data_5p1, 52345, 16215, 36615, 37435)
areas6np_1c45L, radii6np_1c45L, centers6np_1c45L = inscribe_circle_calc(data_6n1,data_6p1, 52345, 16215, 36615, 37435)

areas4np_1c45R, radii4np_1c45R, centers4np_1c45R = inscribe_circle_calc(data_4n1,data_4p1, 21792, 20210, 40175, 46036)
areas5np_1c45R, radii5np_1c45R, centers5np_1c45R = inscribe_circle_calc(data_5n1,data_5p1, 21792, 20210, 40175, 46036)
areas6np_1c45R, radii6np_1c45R, centers6np_1c45R = inscribe_circle_calc(data_6n1,data_6p1, 21792, 20210, 40175, 46036)

fig1_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_1c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_1c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 1 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_1c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_1c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_1c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_1c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig1_45.savefig(f"New_Foramen/Plots/Model 1/Inscr_for_area_1_c45.jpg", dpi = 300)

    #C56
areas4np_1c56L, radii4np_1c56L, centers4np_1c56L = inscribe_circle_calc(data_4n1,data_4p1, 52117, 36527, 57675, 58369)
areas5np_1c56L, radii5np_1c56L, centers5np_1c56L = inscribe_circle_calc(data_5n1,data_5p1, 52117, 36527, 57675, 58369)
areas6np_1c56L, radii6np_1c56L, centers6np_1c56L = inscribe_circle_calc(data_6n1,data_6p1, 52117, 36527, 57675, 58369)

areas4np_1c56R, radii4np_1c56R, centers4np_1c56R = inscribe_circle_calc(data_4n1,data_4p1, 65927, 40272, 62515, 79559)
areas5np_1c56R, radii5np_1c56R, centers5np_1c56R = inscribe_circle_calc(data_5n1,data_5p1, 65927, 40272, 62515, 79559)
areas6np_1c56R, radii6np_1c56R, centers6np_1c56R = inscribe_circle_calc(data_6n1,data_6p1, 65927, 40272, 62515, 79559)

fig1_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_1c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_1c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 1 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_1c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_1c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_1c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_1c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig1_56.savefig(f"New_Foramen/Plots/Model 1/Inscr_for_area_1_c56.jpg", dpi = 300)
plt.show()


#--------------Model 2 -------------------------------------------
data_4n2, data_4p2, data_5n2, data_5p2, data_6n2, data_6p2 = read_file("2")


    #C34
areas4np_2c34L, radii4np_2c34L, centers4np_2c34L = inscribe_circle_calc(data_4n2,data_4p2, 14886, 1297, 16439, 17116)
areas5np_2c34L, radii5np_2c34L, centers5np_2c34L = inscribe_circle_calc(data_5n2,data_5p2, 14886, 1297, 16439, 17116)
areas6np_2c34L, radii6np_2c34L, centers6np_2c34L = inscribe_circle_calc(data_6n2,data_6p2, 14886, 1297, 16439, 17116) 

areas4np_2c34R, radii4np_2c34R, centers4np_2c34R = inscribe_circle_calc(data_4n2,data_4p2, 21922, 4457, 20101, 9037)
areas5np_2c34R, radii5np_2c34R, centers5np_2c34R = inscribe_circle_calc(data_5n2,data_5p2, 21922, 4457, 20101, 9037)
areas6np_2c34R, radii6np_2c34R, centers6np_2c34R = inscribe_circle_calc(data_6n2,data_6p2, 21922, 4457, 20101, 9037)

fig2_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_2c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_2c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 2 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_2c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_2c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_2c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_2c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig2_34.savefig(f"New_Foramen/Plots/Model 2/Inscr_for_area_2_c34.jpg", dpi = 300)

    #C45
areas4np_2c45L, radii4np_2c45L, centers4np_2c45L = inscribe_circle_calc(data_4n2,data_4p2, 52345, 16215, 36615, 37435)
areas5np_2c45L, radii5np_2c45L, centers5np_2c45L = inscribe_circle_calc(data_5n2,data_5p2, 52345, 16215, 36615, 37435)
areas6np_2c45L, radii6np_2c45L, centers6np_2c45L = inscribe_circle_calc(data_6n2,data_6p2, 52345, 16215, 36615, 37435)

areas4np_2c45R, radii4np_2c45R, centers4np_2c45R = inscribe_circle_calc(data_4n2,data_4p2, 21792, 20210, 40175, 46036)
areas5np_2c45R, radii5np_2c45R, centers5np_2c45R = inscribe_circle_calc(data_5n2,data_5p2, 21792, 20210, 40175, 46036)
areas6np_2c45R, radii6np_2c45R, centers6np_2c45R = inscribe_circle_calc(data_6n2,data_6p2, 21792, 20210, 40175, 46036)

fig2_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_2c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_2c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 2 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_2c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_2c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_2c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_2c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig2_45.savefig(f"New_Foramen/Plots/Model 2/Inscr_for_area_2_c45.jpg", dpi = 300)

    #C56
areas4np_2c56L, radii4np_2c56L, centers4np_2c56L = inscribe_circle_calc(data_4n2,data_4p2, 52117, 36527, 57675, 58369)
areas5np_2c56L, radii5np_2c56L, centers5np_2c56L = inscribe_circle_calc(data_5n2,data_5p2, 52117, 36527, 57675, 58369)
areas6np_2c56L, radii6np_2c56L, centers6np_2c56L = inscribe_circle_calc(data_6n2,data_6p2, 52117, 36527, 57675, 58369)

areas4np_2c56R, radii4np_2c56R, centers4np_2c56R = inscribe_circle_calc(data_4n2,data_4p2, 65927, 40272, 62515, 79559)
areas5np_2c56R, radii5np_2c56R, centers5np_2c56R = inscribe_circle_calc(data_5n2,data_5p2, 65927, 40272, 62515, 79559)
areas6np_2c56R, radii6np_2c56R, centers6np_2c56R = inscribe_circle_calc(data_6n2,data_6p2, 65927, 40272, 62515, 79559)

fig2_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_2c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_2c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 2 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_2c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_2c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_2c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_2c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig2_56.savefig(f"New_Foramen/Plots/Model 2/Inscr_for_area_2_c56.jpg", dpi = 300)
plt.show()

#----Model 3 ------------------------------------------------------------

data_4n3, data_4p3, data_5n3, data_5p3, data_6n3, data_6p3 = read_file("3")


    #C34
areas4np_3c34L, radii4np_3c34L, centers4np_3c34L = inscribe_circle_calc(data_4n3,data_4p3, 14886, 1297, 16439, 17116)
areas5np_3c34L, radii5np_3c34L, centers5np_3c34L = inscribe_circle_calc(data_5n3,data_5p3, 14886, 1297, 16439, 17116)
areas6np_3c34L, radii6np_3c34L, centers6np_3c34L = inscribe_circle_calc(data_6n3,data_6p3, 14886, 1297, 16439, 17116) 

areas4np_3c34R, radii4np_3c34R, centers4np_3c34R = inscribe_circle_calc(data_4n3,data_4p3, 21922, 4457, 20101, 9037)
areas5np_3c34R, radii5np_3c34R, centers5np_3c34R = inscribe_circle_calc(data_5n3,data_5p3, 21922, 4457, 20101, 9037)
areas6np_3c34R, radii6np_3c34R, centers6np_3c34R = inscribe_circle_calc(data_6n3,data_6p3, 21922, 4457, 20101, 9037)

fig3_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_3c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_3c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 3 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_3c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_3c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_3c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_3c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig3_34.savefig(f"New_Foramen/Plots/Model 3/Inscr_for_area_3_c34.jpg", dpi = 300)

    #C45
areas4np_3c45L, radii4np_3c45L, centers4np_3c45L = inscribe_circle_calc(data_4n3,data_4p3, 52345, 16215, 36615, 37435)
areas5np_3c45L, radii5np_3c45L, centers5np_3c45L = inscribe_circle_calc(data_5n3,data_5p3, 52345, 16215, 36615, 37435)
areas6np_3c45L, radii6np_3c45L, centers6np_3c45L = inscribe_circle_calc(data_6n3,data_6p3, 52345, 16215, 36615, 37435)

areas4np_3c45R, radii4np_3c45R, centers4np_3c45R = inscribe_circle_calc(data_4n3,data_4p3, 21792, 20210, 40175, 46036)
areas5np_3c45R, radii5np_3c45R, centers5np_3c45R = inscribe_circle_calc(data_5n3,data_5p3, 21792, 20210, 40175, 46036)
areas6np_3c45R, radii6np_3c45R, centers6np_3c45R = inscribe_circle_calc(data_6n3,data_6p3, 21792, 20210, 40175, 46036)

fig3_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_3c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_3c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 3 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_3c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_3c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_3c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_3c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig3_45.savefig(f"New_Foramen/Plots/Model 3/Inscr_for_area_3_c45.jpg", dpi = 300)

    #C56
areas4np_3c56L, radii4np_3c56L, centers4np_3c56L = inscribe_circle_calc(data_4n3,data_4p3, 52117, 36527, 57675, 58369)
areas5np_3c56L, radii5np_3c56L, centers5np_3c56L = inscribe_circle_calc(data_5n3,data_5p3, 52117, 36527, 57675, 58369)
areas6np_3c56L, radii6np_3c56L, centers6np_3c56L = inscribe_circle_calc(data_6n3,data_6p3, 52117, 36527, 57675, 58369)

areas4np_3c56R, radii4np_3c56R, centers4np_3c56R = inscribe_circle_calc(data_4n3,data_4p3, 65927, 40272, 62515, 79559)
areas5np_3c56R, radii5np_3c56R, centers5np_3c56R = inscribe_circle_calc(data_5n3,data_5p3, 65927, 40272, 62515, 79559)
areas6np_3c56R, radii6np_3c56R, centers6np_3c56R = inscribe_circle_calc(data_6n3,data_6p3, 65927, 40272, 62515, 79559)

fig3_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_3c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_3c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 3 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_3c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_3c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_3c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_3c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig3_56.savefig(f"New_Foramen/Plots/Model 3/Inscr_for_area_3_c56.jpg", dpi = 300)
plt.show()

#-------------- Model 4 ---------------------------------------------------------
data_4n4, data_4p4, data_5n4, data_5p4, data_6n4, data_6p4 = read_file("4")


    #C34
areas4np_4c34L, radii4np_4c34L, centers4np_4c34L = inscribe_circle_calc(data_4n4,data_4p4, 14886, 1297, 16439, 17116)
areas5np_4c34L, radii5np_4c34L, centers5np_4c34L = inscribe_circle_calc(data_5n4,data_5p4, 14886, 1297, 16439, 17116)
areas6np_4c34L, radii6np_4c34L, centers6np_4c34L = inscribe_circle_calc(data_6n4,data_6p4, 14886, 1297, 16439, 17116) 

areas4np_4c34R, radii4np_4c34R, centers4np_4c34R = inscribe_circle_calc(data_4n4,data_4p4, 21922, 4457, 20101, 9037)
areas5np_4c34R, radii5np_4c34R, centers5np_4c34R = inscribe_circle_calc(data_5n4,data_5p4, 21922, 4457, 20101, 9037)
areas6np_4c34R, radii6np_4c34R, centers6np_4c34R = inscribe_circle_calc(data_6n4,data_6p4, 21922, 4457, 20101, 9037)

fig4_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_4c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_4c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 4 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_4c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_4c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_4c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_4c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig4_34.savefig(f"New_Foramen/Plots/Model 4/Inscr_for_area_4_c34.jpg", dpi = 300)

    #C45
areas4np_4c45L, radii4np_4c45L, centers4np_4c45L = inscribe_circle_calc(data_4n4,data_4p4, 52345, 16215, 36615, 37435)
areas5np_4c45L, radii5np_4c45L, centers5np_4c45L = inscribe_circle_calc(data_5n4,data_5p4, 52345, 16215, 36615, 37435)
areas6np_4c45L, radii6np_4c45L, centers6np_4c45L = inscribe_circle_calc(data_6n4,data_6p4, 52345, 16215, 36615, 37435)

areas4np_4c45R, radii4np_4c45R, centers4np_4c45R = inscribe_circle_calc(data_4n4,data_4p4, 21792, 20210, 40175, 46036)
areas5np_4c45R, radii5np_4c45R, centers5np_4c45R = inscribe_circle_calc(data_5n4,data_5p4, 21792, 20210, 40175, 46036)
areas6np_4c45R, radii6np_4c45R, centers6np_4c45R = inscribe_circle_calc(data_6n4,data_6p4, 21792, 20210, 40175, 46036)

fig4_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_4c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_4c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 4 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_4c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_4c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_4c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_4c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig4_45.savefig(f"New_Foramen/Plots/Model 4/Inscr_for_area_4_c45.jpg", dpi = 300)

    #C56
areas4np_4c56L, radii4np_4c56L, centers4np_4c56L = inscribe_circle_calc(data_4n4,data_4p4, 52117, 36527, 57675, 58369)
areas5np_4c56L, radii5np_4c56L, centers5np_4c56L = inscribe_circle_calc(data_5n4,data_5p4, 52117, 36527, 57675, 58369)
areas6np_4c56L, radii6np_4c56L, centers6np_4c56L = inscribe_circle_calc(data_6n4,data_6p4, 52117, 36527, 57675, 58369)

areas4np_4c56R, radii4np_4c56R, centers4np_4c56R = inscribe_circle_calc(data_4n4,data_4p4, 65927, 40272, 62515, 79559)
areas5np_4c56R, radii5np_4c56R, centers5np_4c56R = inscribe_circle_calc(data_5n4,data_5p4, 65927, 40272, 62515, 79559)
areas6np_4c56R, radii6np_4c56R, centers6np_4c56R = inscribe_circle_calc(data_6n4,data_6p4, 65927, 40272, 62515, 79559)

fig4_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_4c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_4c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 4 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_4c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_4c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_4c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_4c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig4_56.savefig(f"New_Foramen/Plots/Model 4/Inscr_for_area_4_c56.jpg", dpi = 300)

plt.show()
   
#-------------- Model 5 ---------------------------------------------------------
data_4n5, data_4p5, data_5n5, data_5p5, data_6n5, data_6p5 = read_file("5")


    #C34
areas4np_5c34L, radii4np_5c34L, centers4np_5c34L = inscribe_circle_calc(data_4n5,data_4p5, 14886, 1297, 16439, 17116)
areas5np_5c34L, radii5np_5c34L, centers5np_5c34L = inscribe_circle_calc(data_5n5,data_5p5, 14886, 1297, 16439, 17116)
areas6np_5c34L, radii6np_5c34L, centers6np_5c34L = inscribe_circle_calc(data_6n5,data_6p5, 14886, 1297, 16439, 17116) 

areas4np_5c34R, radii4np_5c34R, centers4np_5c34R = inscribe_circle_calc(data_4n5,data_4p5, 21922, 4457, 20101, 9037)
areas5np_5c34R, radii5np_5c34R, centers5np_5c34R = inscribe_circle_calc(data_5n5,data_5p5, 21922, 4457, 20101, 9037)
areas6np_5c34R, radii6np_5c34R, centers6np_5c34R = inscribe_circle_calc(data_6n5,data_6p5, 21922, 4457, 20101, 9037)

fig5_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_5c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_5c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 5 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_5c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_5c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_5c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_5c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig5_34.savefig(f"New_Foramen/Plots/Model 5/Inscr_for_area_5_c34.jpg", dpi = 300)

    #C45
areas4np_5c45L, radii4np_5c45L, centers4np_5c45L = inscribe_circle_calc(data_4n5,data_4p5, 52345, 16215, 36615, 37435)
areas5np_5c45L, radii5np_5c45L, centers5np_5c45L = inscribe_circle_calc(data_5n5,data_5p5, 52345, 16215, 36615, 37435)
areas6np_5c45L, radii6np_5c45L, centers6np_5c45L = inscribe_circle_calc(data_6n5,data_6p5, 52345, 16215, 36615, 37435)

areas4np_5c45R, radii4np_5c45R, centers4np_5c45R = inscribe_circle_calc(data_4n5,data_4p5, 21792, 20210, 40175, 46036)
areas5np_5c45R, radii5np_5c45R, centers5np_5c45R = inscribe_circle_calc(data_5n5,data_5p5, 21792, 20210, 40175, 46036)
areas6np_5c45R, radii6np_5c45R, centers6np_5c45R = inscribe_circle_calc(data_6n5,data_6p5, 21792, 20210, 40175, 46036)

fig5_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_5c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_5c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 5 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_5c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_5c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_5c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_5c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig5_45.savefig(f"New_Foramen/Plots/Model 5/Inscr_for_area_5_c45.jpg", dpi = 300)

    #C56
areas4np_5c56L, radii4np_5c56L, centers4np_5c56L = inscribe_circle_calc(data_4n5,data_4p5, 52117, 36527, 57675, 58369)
areas5np_5c56L, radii5np_5c56L, centers5np_5c56L = inscribe_circle_calc(data_5n5,data_5p5, 52117, 36527, 57675, 58369)
areas6np_5c56L, radii6np_5c56L, centers6np_5c56L = inscribe_circle_calc(data_6n5,data_6p5, 52117, 36527, 57675, 58369)

areas4np_5c56R, radii4np_5c56R, centers4np_5c56R = inscribe_circle_calc(data_4n5,data_4p5, 65927, 40272, 62515, 79559)
areas5np_5c56R, radii5np_5c56R, centers5np_5c56R = inscribe_circle_calc(data_5n5,data_5p5, 65927, 40272, 62515, 79559)
areas6np_5c56R, radii6np_5c56R, centers6np_5c56R = inscribe_circle_calc(data_6n5,data_6p5, 65927, 40272, 62515, 79559)

fig5_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_5c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_5c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 5 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_5c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_5c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_5c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_5c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig5_56.savefig(f"New_Foramen/Plots/Model 5/Inscr_for_area_5_c56.jpg", dpi = 300)

plt.show()

# ---------------- Model 6 ----------------------------------------------------
data_4n6, data_4p6, data_5n6, data_5p6, data_6n6, data_6p6 = read_file("6")


    #C34
areas4np_6c34L, radii4np_6c34L, centers4np_6c34L = inscribe_circle_calc(data_4n6,data_4p6, 14886, 1297, 16439, 17116)
areas5np_6c34L, radii5np_6c34L, centers5np_6c34L = inscribe_circle_calc(data_5n6,data_5p6, 14886, 1297, 16439, 17116)
areas6np_6c34L, radii6np_6c34L, centers6np_6c34L = inscribe_circle_calc(data_6n6,data_6p6, 14886, 1297, 16439, 17116) 

areas4np_6c34R, radii4np_6c34R, centers4np_6c34R = inscribe_circle_calc(data_4n6,data_4p6, 21922, 4457, 20101, 9037)
areas5np_6c34R, radii5np_6c34R, centers5np_6c34R = inscribe_circle_calc(data_5n6,data_5p6, 21922, 4457, 20101, 9037)
areas6np_6c34R, radii6np_6c34R, centers6np_6c34R = inscribe_circle_calc(data_6n6,data_6p6, 21922, 4457, 20101, 9037)

fig6_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_6c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_6c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 6 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_6c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_6c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_6c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_6c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig6_34.savefig(f"New_Foramen/Plots/Model 6/Inscr_for_area_6_c34.jpg", dpi = 300)

    #C45
areas4np_6c45L, radii4np_6c45L, centers4np_6c45L = inscribe_circle_calc(data_4n6,data_4p6, 52345, 16215, 36615, 37435)
areas5np_6c45L, radii5np_6c45L, centers5np_6c45L = inscribe_circle_calc(data_5n6,data_5p6, 52345, 16215, 36615, 37435)
areas6np_6c45L, radii6np_6c45L, centers6np_6c45L = inscribe_circle_calc(data_6n6,data_6p6, 52345, 16215, 36615, 37435)

areas4np_6c45R, radii4np_6c45R, centers4np_6c45R = inscribe_circle_calc(data_4n6,data_4p6, 21792, 20210, 40175, 46036)
areas5np_6c45R, radii5np_6c45R, centers5np_6c45R = inscribe_circle_calc(data_5n6,data_5p6, 21792, 20210, 40175, 46036)
areas6np_6c45R, radii6np_6c45R, centers6np_6c45R = inscribe_circle_calc(data_6n6,data_6p6, 21792, 20210, 40175, 46036)

fig6_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_6c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_6c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 6 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_6c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_6c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_6c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_6c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig6_45.savefig(f"New_Foramen/Plots/Model 6/Inscr_for_area_6_c45.jpg", dpi = 300)

    #C56
areas4np_6c56L, radii4np_6c56L, centers4np_6c56L = inscribe_circle_calc(data_4n6,data_4p6, 52117, 36527, 57675, 58369)
areas5np_6c56L, radii5np_6c56L, centers5np_6c56L = inscribe_circle_calc(data_5n6,data_5p6, 52117, 36527, 57675, 58369)
areas6np_6c56L, radii6np_6c56L, centers6np_6c56L = inscribe_circle_calc(data_6n6,data_6p6, 52117, 36527, 57675, 58369)

areas4np_6c56R, radii4np_6c56R, centers4np_6c56R = inscribe_circle_calc(data_4n6,data_4p6, 65927, 40272, 62515, 79559)
areas5np_6c56R, radii5np_6c56R, centers5np_6c56R = inscribe_circle_calc(data_5n6,data_5p6, 65927, 40272, 62515, 79559)
areas6np_6c56R, radii6np_6c56R, centers6np_6c56R = inscribe_circle_calc(data_6n6,data_6p6, 65927, 40272, 62515, 79559)

fig6_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_6c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_6c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 6 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_6c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_6c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_6c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_6c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig6_56.savefig(f"New_Foramen/Plots/Model 6/Inscr_for_area_6_c56.jpg", dpi = 300)

plt.show()




# ---------------- Model 7 ----------------------------------------------------
data_4n7, data_4p7, data_5n7, data_5p7, data_6n7, data_6p7 = read_file("7")


    #C34
areas4np_7c34L, radii4np_7c34L, centers4np_7c34L = inscribe_circle_calc(data_4n7,data_4p7, 14886, 1297, 16439, 17116)
areas5np_7c34L, radii5np_7c34L, centers5np_7c34L = inscribe_circle_calc(data_5n7,data_5p7, 14886, 1297, 16439, 17116)
areas6np_7c34L, radii6np_7c34L, centers6np_7c34L = inscribe_circle_calc(data_6n7,data_6p7, 14886, 1297, 16439, 17116) 

areas4np_7c34R, radii4np_7c34R, centers4np_7c34R = inscribe_circle_calc(data_4n7,data_4p7, 21922, 4457, 20101, 9037)
areas5np_7c34R, radii5np_7c34R, centers5np_7c34R = inscribe_circle_calc(data_5n7,data_5p7, 21922, 4457, 20101, 9037)
areas6np_7c34R, radii6np_7c34R, centers6np_7c34R = inscribe_circle_calc(data_6n7,data_6p7, 21922, 4457, 20101, 9037)

fig7_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_7c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_7c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 7 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_7c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_7c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_7c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_7c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig7_34.savefig(f"New_Foramen/Plots/Model 7/Inscr_for_area_7_c34.jpg", dpi = 300)

    #C45
areas4np_7c45L, radii4np_7c45L, centers4np_7c45L = inscribe_circle_calc(data_4n7,data_4p7, 52345, 16215, 36615, 37435)
areas5np_7c45L, radii5np_7c45L, centers5np_7c45L = inscribe_circle_calc(data_5n7,data_5p7, 52345, 16215, 36615, 37435)
areas6np_7c45L, radii6np_7c45L, centers6np_7c45L = inscribe_circle_calc(data_6n7,data_6p7, 52345, 16215, 36615, 37435)

areas4np_7c45R, radii4np_7c45R, centers4np_7c45R = inscribe_circle_calc(data_4n7,data_4p7, 21792, 20210, 40175, 46036)
areas5np_7c45R, radii5np_7c45R, centers5np_7c45R = inscribe_circle_calc(data_5n7,data_5p7, 21792, 20210, 40175, 46036)
areas6np_7c45R, radii6np_7c45R, centers6np_7c45R = inscribe_circle_calc(data_6n7,data_6p7, 21792, 20210, 40175, 46036)

fig7_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_7c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_7c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 7 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_7c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_7c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_7c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_7c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig7_45.savefig(f"New_Foramen/Plots/Model 7/Inscr_for_area_7_c45.jpg", dpi = 300)

    #C56
areas4np_7c56L, radii4np_7c56L, centers4np_7c56L = inscribe_circle_calc(data_4n7,data_4p7, 52117, 36527, 57675, 58369)
areas5np_7c56L, radii5np_7c56L, centers5np_7c56L = inscribe_circle_calc(data_5n7,data_5p7, 52117, 36527, 57675, 58369)
areas6np_7c56L, radii6np_7c56L, centers6np_7c56L = inscribe_circle_calc(data_6n7,data_6p7, 52117, 36527, 57675, 58369)

areas4np_7c56R, radii4np_7c56R, centers4np_7c56R = inscribe_circle_calc(data_4n7,data_4p7, 65927, 40272, 62515, 79559)
areas5np_7c56R, radii5np_7c56R, centers5np_7c56R = inscribe_circle_calc(data_5n7,data_5p7, 65927, 40272, 62515, 79559)
areas6np_7c56R, radii6np_7c56R, centers6np_7c56R = inscribe_circle_calc(data_6n7,data_6p7, 65927, 40272, 62515, 79559)

fig7_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_7c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_7c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 7 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_7c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_7c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_7c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_7c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig7_56.savefig(f"New_Foramen/Plots/Model 7/Inscr_for_area_7_c56.jpg", dpi = 300)

plt.show()


   

# ---------------- Model 8 ----------------------------------------------------
data_4n8, data_4p8, data_5n8, data_5p8, data_6n8, data_6p8 = read_file("8")


    #C34
areas4np_8c34L, radii4np_8c34L, centers4np_8c34L = inscribe_circle_calc(data_4n8,data_4p8, 14886, 1297, 16439, 17116)
areas5np_8c34L, radii5np_8c34L, centers5np_8c34L = inscribe_circle_calc(data_5n8,data_5p8, 14886, 1297, 16439, 17116)
areas6np_8c34L, radii6np_8c34L, centers6np_8c34L = inscribe_circle_calc(data_6n8,data_6p8, 14886, 1297, 16439, 17116) 

areas4np_8c34R, radii4np_8c34R, centers4np_8c34R = inscribe_circle_calc(data_4n8,data_4p8, 21922, 4457, 20101, 9037)
areas5np_8c34R, radii5np_8c34R, centers5np_8c34R = inscribe_circle_calc(data_5n8,data_5p8, 21922, 4457, 20101, 9037)
areas6np_8c34R, radii6np_8c34R, centers6np_8c34R = inscribe_circle_calc(data_6n8,data_6p8, 21922, 4457, 20101, 9037)

fig8_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_8c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_8c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 8 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_8c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_8c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_8c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_8c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig8_34.savefig(f"New_Foramen/Plots/Model 8/Inscr_for_area_8_c34.jpg", dpi = 300)

    #C45
areas4np_8c45L, radii4np_8c45L, centers4np_8c45L = inscribe_circle_calc(data_4n8,data_4p8, 52345, 16215, 36615, 37435)
areas5np_8c45L, radii5np_8c45L, centers5np_8c45L = inscribe_circle_calc(data_5n8,data_5p8, 52345, 16215, 36615, 37435)
areas6np_8c45L, radii6np_8c45L, centers6np_8c45L = inscribe_circle_calc(data_6n8,data_6p8, 52345, 16215, 36615, 37435)

areas4np_8c45R, radii4np_8c45R, centers4np_8c45R = inscribe_circle_calc(data_4n8,data_4p8, 21792, 20210, 40175, 46036)
areas5np_8c45R, radii5np_8c45R, centers5np_8c45R = inscribe_circle_calc(data_5n8,data_5p8, 21792, 20210, 40175, 46036)
areas6np_8c45R, radii6np_8c45R, centers6np_8c45R = inscribe_circle_calc(data_6n8,data_6p8, 21792, 20210, 40175, 46036)

fig8_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_8c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_8c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 8 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_8c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_8c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_8c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_8c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig8_45.savefig(f"New_Foramen/Plots/Model 8/Inscr_for_area_8_c45.jpg", dpi = 300)

    #C56
areas4np_8c56L, radii4np_8c56L, centers4np_8c56L = inscribe_circle_calc(data_4n8,data_4p8, 52117, 36527, 57675, 58369)
areas5np_8c56L, radii5np_8c56L, centers5np_8c56L = inscribe_circle_calc(data_5n8,data_5p8, 52117, 36527, 57675, 58369)
areas6np_8c56L, radii6np_8c56L, centers6np_8c56L = inscribe_circle_calc(data_6n8,data_6p8, 52117, 36527, 57675, 58369)

areas4np_8c56R, radii4np_8c56R, centers4np_8c56R = inscribe_circle_calc(data_4n8,data_4p8, 65927, 40272, 62515, 79559)
areas5np_8c56R, radii5np_8c56R, centers5np_8c56R = inscribe_circle_calc(data_5n8,data_5p8, 65927, 40272, 62515, 79559)
areas6np_8c56R, radii6np_8c56R, centers6np_8c56R = inscribe_circle_calc(data_6n8,data_6p8, 65927, 40272, 62515, 79559)

fig8_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_8c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_8c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 8 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_8c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_8c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_8c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_8c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig8_56.savefig(f"New_Foramen/Plots/Model 8/Inscr_for_area_8_c56.jpg", dpi = 300)

plt.show()

      

# ---------------- Model 9 ----------------------------------------------------
data_4n9, data_4p9, data_5n9, data_5p9, data_6n9, data_6p9 = read_file("9")


    #C34
areas4np_9c34L, radii4np_9c34L, centers4np_9c34L = inscribe_circle_calc(data_4n9,data_4p9, 14886, 1297, 16439, 17116)
areas5np_9c34L, radii5np_9c34L, centers5np_9c34L = inscribe_circle_calc(data_5n9,data_5p9, 14886, 1297, 16439, 17116)
areas6np_9c34L, radii6np_9c34L, centers6np_9c34L = inscribe_circle_calc(data_6n9,data_6p9, 14886, 1297, 16439, 17116) 

areas4np_9c34R, radii4np_9c34R, centers4np_9c34R = inscribe_circle_calc(data_4n9,data_4p9, 21922, 4457, 20101, 9037)
areas5np_9c34R, radii5np_9c34R, centers5np_9c34R = inscribe_circle_calc(data_5n9,data_5p9, 21922, 4457, 20101, 9037)
areas6np_9c34R, radii6np_9c34R, centers6np_9c34R = inscribe_circle_calc(data_6n9,data_6p9, 21922, 4457, 20101, 9037)

fig9_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_9c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_9c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 9 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_9c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_9c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_9c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_9c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig9_34.savefig(f"New_Foramen/Plots/Model 9/Inscr_for_area_9_c34.jpg", dpi = 300)

    #C45
areas4np_9c45L, radii4np_9c45L, centers4np_9c45L = inscribe_circle_calc(data_4n9,data_4p9, 52345, 16215, 36615, 37435)
areas5np_9c45L, radii5np_9c45L, centers5np_9c45L = inscribe_circle_calc(data_5n9,data_5p9, 52345, 16215, 36615, 37435)
areas6np_9c45L, radii6np_9c45L, centers6np_9c45L = inscribe_circle_calc(data_6n9,data_6p9, 52345, 16215, 36615, 37435)

areas4np_9c45R, radii4np_9c45R, centers4np_9c45R = inscribe_circle_calc(data_4n9,data_4p9, 21792, 20210, 40175, 46036)
areas5np_9c45R, radii5np_9c45R, centers5np_9c45R = inscribe_circle_calc(data_5n9,data_5p9, 21792, 20210, 40175, 46036)
areas6np_9c45R, radii6np_9c45R, centers6np_9c45R = inscribe_circle_calc(data_6n9,data_6p9, 21792, 20210, 40175, 46036)

fig9_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_9c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_9c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 9 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_9c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_9c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_9c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_9c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig9_45.savefig(f"New_Foramen/Plots/Model 9/Inscr_for_area_9_c45.jpg", dpi = 300)

    #C56
areas4np_9c56L, radii4np_9c56L, centers4np_9c56L = inscribe_circle_calc(data_4n9,data_4p9, 52117, 36527, 57675, 58369)
areas5np_9c56L, radii5np_9c56L, centers5np_9c56L = inscribe_circle_calc(data_5n9,data_5p9, 52117, 36527, 57675, 58369)
areas6np_9c56L, radii6np_9c56L, centers6np_9c56L = inscribe_circle_calc(data_6n9,data_6p9, 52117, 36527, 57675, 58369)

areas4np_9c56R, radii4np_9c56R, centers4np_9c56R = inscribe_circle_calc(data_4n9,data_4p9, 65927, 40272, 62515, 79559)
areas5np_9c56R, radii5np_9c56R, centers5np_9c56R = inscribe_circle_calc(data_5n9,data_5p9, 65927, 40272, 62515, 79559)
areas6np_9c56R, radii6np_9c56R, centers6np_9c56R = inscribe_circle_calc(data_6n9,data_6p9, 65927, 40272, 62515, 79559)

fig9_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_9c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_9c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 9 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_9c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_9c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_9c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_9c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig9_56.savefig(f"New_Foramen/Plots/Model 9/Inscr_for_area_9_c56.jpg", dpi = 300)

plt.show()

      

#-------------- Model 10---------------------------------------------------------
data_4n10, data_4p10, data_5n10, data_5p10, data_6n10, data_6p10 = read_file("10")


    #C34
    
areas4np_10c34L, radii4np_10c34L, centers4np_10c34L = inscribe_circle_calc(data_4n10,data_4p10, 14886, 1297, 16439, 17116)
areas5np_10c34L, radii5np_10c34L, centers5np_10c34L = inscribe_circle_calc(data_5n10,data_5p10, 14886, 1297, 16439, 17116)
areas6np_10c34L, radii6np_10c34L, centers6np_10c34L = inscribe_circle_calc(data_6n10,data_6p10, 14886, 1297, 16439, 17116) 

areas4np_10c34R, radii4np_10c34R, centers4np_10c34R = inscribe_circle_calc(data_4n10,data_4p10, 21922, 4457, 20101, 9037)
areas5np_10c34R, radii5np_10c34R, centers5np_10c34R = inscribe_circle_calc(data_5n10,data_5p10, 21922, 4457, 20101, 9037)
areas6np_10c34R, radii6np_10c34R, centers6np_10c34R = inscribe_circle_calc(data_6n10,data_6p10, 21922, 4457, 20101, 9037)

fig10_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_10c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_10c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 10 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_10c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_10c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_10c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_10c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig10_34.savefig(f"New_Foramen/Plots/Model 10/Inscr_for_area_10_c34.jpg", dpi = 300)

    #C45

areas4np_10c45L, radii4np_10c45L, centers4np_10c45L = inscribe_circle_calc(data_4n10,data_4p10, 52345, 16215, 36615, 37435)
areas5np_10c45L, radii5np_10c45L, centers5np_10c45L = inscribe_circle_calc(data_5n10,data_5p10, 52345, 16215, 36615, 37435)
areas6np_10c45L, radii6np_10c45L, centers6np_10c45L = inscribe_circle_calc(data_6n10,data_6p10, 52345, 16215, 36615, 37435)

areas4np_10c45R, radii4np_10c45R, centers4np_10c45R = inscribe_circle_calc(data_4n10,data_4p10, 21792, 20210, 40175, 46036)
areas5np_10c45R, radii5np_10c45R, centers5np_10c45R = inscribe_circle_calc(data_5n10,data_5p10, 21792, 20210, 40175, 46036)
areas6np_10c45R, radii6np_10c45R, centers6np_10c45R = inscribe_circle_calc(data_6n10,data_6p10, 21792, 20210, 40175, 46036)

fig10_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_10c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_10c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 10 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_10c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_10c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_10c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_10c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig10_45.savefig(f"New_Foramen/Plots/Model 10/Inscr_for_area_10_c45.jpg", dpi = 300)

    #C56
areas4np_10c56L, radii4np_10c56L, centers4np_10c56L = inscribe_circle_calc(data_4n10,data_4p10, 52117, 36527, 57675, 58369)
areas5np_10c56L, radii5np_10c56L, centers5np_10c56L = inscribe_circle_calc(data_5n10,data_5p10, 52117, 36527, 57675, 58369)
areas6np_10c56L, radii6np_10c56L, centers6np_10c56L = inscribe_circle_calc(data_6n10,data_6p10, 52117, 36527, 57675, 58369)

areas4np_10c56R, radii4np_10c56R, centers4np_10c56R = inscribe_circle_calc(data_4n10,data_4p10, 65927, 40272, 62515, 79559)
areas5np_10c56R, radii5np_10c56R, centers5np_10c56R = inscribe_circle_calc(data_5n10,data_5p10, 65927, 40272, 62515, 79559)
areas6np_10c56R, radii6np_10c56R, centers6np_10c56R = inscribe_circle_calc(data_6n10,data_6p10, 65927, 40272, 62515, 79559)

fig10_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_10c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_10c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 10 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_10c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_10c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_10c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_10c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig10_56.savefig(f"New_Foramen/Plots/Model 10/Inscr_for_area_10_c56.jpg", dpi = 300)

plt.show()

      

#-------------- Model 11---------------------------------------------------------
data_4n11, data_4p11, data_5n11, data_5p11, data_6n11, data_6p11 = read_file("11")


    #C34
    
areas4np_11c34L, radii4np_11c34L, centers4np_11c34L = inscribe_circle_calc(data_4n11,data_4p11, 14886, 1297, 16439, 17116)
areas5np_11c34L, radii5np_11c34L, centers5np_11c34L = inscribe_circle_calc(data_5n11,data_5p11, 14886, 1297, 16439, 17116)
areas6np_11c34L, radii6np_11c34L, centers6np_11c34L = inscribe_circle_calc(data_6n11,data_6p11, 14886, 1297, 16439, 17116) 

areas4np_11c34R, radii4np_11c34R, centers4np_11c34R = inscribe_circle_calc(data_4n11,data_4p11, 21922, 4457, 20101, 9037)
areas5np_11c34R, radii5np_11c34R, centers5np_11c34R = inscribe_circle_calc(data_5n11,data_5p11, 21922, 4457, 20101, 9037)
areas6np_11c34R, radii6np_11c34R, centers6np_11c34R = inscribe_circle_calc(data_6n11,data_6p11, 21922, 4457, 20101, 9037)

fig11_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_11c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_11c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 11 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_11c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_11c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_11c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_11c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig11_34.savefig(f"New_Foramen/Plots/Model 11/Inscr_for_area_11_c34.jpg", dpi = 300)


    #C45

areas4np_11c45L, radii4np_11c45L, centers4np_11c45L = inscribe_circle_calc(data_4n11,data_4p11, 52345, 16215, 36615, 37435)
areas5np_11c45L, radii5np_11c45L, centers5np_11c45L = inscribe_circle_calc(data_5n11,data_5p11, 52345, 16215, 36615, 37435)
areas6np_11c45L, radii6np_11c45L, centers6np_11c45L = inscribe_circle_calc(data_6n11,data_6p11, 52345, 16215, 36615, 37435)

areas4np_11c45R, radii4np_11c45R, centers4np_11c45R = inscribe_circle_calc(data_4n11,data_4p11, 21792, 20210, 40175, 46036)
areas5np_11c45R, radii5np_11c45R, centers5np_11c45R = inscribe_circle_calc(data_5n11,data_5p11, 21792, 20210, 40175, 46036)
areas6np_11c45R, radii6np_11c45R, centers6np_11c45R = inscribe_circle_calc(data_6n11,data_6p11, 21792, 20210, 40175, 46036)

fig11_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_11c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_11c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 11 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_11c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_11c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_11c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_11c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig11_45.savefig(f"New_Foramen/Plots/Model 11/Inscr_for_area_11_c45.jpg", dpi = 300)

    #C56
areas4np_11c56L, radii4np_11c56L, centers4np_11c56L = inscribe_circle_calc(data_4n11,data_4p11, 52117, 36527, 57675, 58369)
areas5np_11c56L, radii5np_11c56L, centers5np_11c56L = inscribe_circle_calc(data_5n11,data_5p11, 52117, 36527, 57675, 58369)
areas6np_11c56L, radii6np_11c56L, centers6np_11c56L = inscribe_circle_calc(data_6n11,data_6p11, 52117, 36527, 57675, 58369)

areas4np_11c56R, radii4np_11c56R, centers4np_11c56R = inscribe_circle_calc(data_4n11,data_4p11, 65927, 40272, 62515, 79559)
areas5np_11c56R, radii5np_11c56R, centers5np_11c56R = inscribe_circle_calc(data_5n11,data_5p11, 65927, 40272, 62515, 79559)
areas6np_11c56R, radii6np_11c56R, centers6np_11c56R = inscribe_circle_calc(data_6n11,data_6p11, 65927, 40272, 62515, 79559)

fig11_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_11c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_11c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 11 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_11c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_11c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_11c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_11c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig11_56.savefig(f"New_Foramen/Plots/Model 11/Inscr_for_area_11_c56.jpg", dpi = 300)

plt.show()
      

#-------------- Model 12---------------------------------------------------------
data_4n12, data_4p12, data_5n12, data_5p12, data_6n12, data_6p12 = read_file("12")


    #C34
    
areas4np_12c34L, radii4np_12c34L, centers4np_12c34L = inscribe_circle_calc(data_4n12,data_4p12, 14886, 1297, 16439, 17116)
areas5np_12c34L, radii5np_12c34L, centers5np_12c34L = inscribe_circle_calc(data_5n12,data_5p12, 14886, 1297, 16439, 17116)
areas6np_12c34L, radii6np_12c34L, centers6np_12c34L = inscribe_circle_calc(data_6n12,data_6p12, 14886, 1297, 16439, 17116) 

areas4np_12c34R, radii4np_12c34R, centers4np_12c34R = inscribe_circle_calc(data_4n12,data_4p12, 21922, 4457, 20101, 9037)
areas5np_12c34R, radii5np_12c34R, centers5np_12c34R = inscribe_circle_calc(data_5n12,data_5p12, 21922, 4457, 20101, 9037)
areas6np_12c34R, radii6np_12c34R, centers6np_12c34R = inscribe_circle_calc(data_6n12,data_6p12, 21922, 4457, 20101, 9037)

fig12_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_12c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_12c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 12 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_12c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_12c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_12c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_12c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig12_34.savefig(f"New_Foramen/Plots/Model 12/Inscr_for_area_12_c34.jpg", dpi = 300)
 
    #C45

areas4np_12c45L, radii4np_12c45L, centers4np_12c45L = inscribe_circle_calc(data_4n12,data_4p12, 52345, 16215, 36615, 37435)
areas5np_12c45L, radii5np_12c45L, centers5np_12c45L = inscribe_circle_calc(data_5n12,data_5p12, 52345, 16215, 36615, 37435)
areas6np_12c45L, radii6np_12c45L, centers6np_12c45L = inscribe_circle_calc(data_6n12,data_6p12, 52345, 16215, 36615, 37435)

areas4np_12c45R, radii4np_12c45R, centers4np_12c45R = inscribe_circle_calc(data_4n12,data_4p12, 21792, 20210, 40175, 46036)
areas5np_12c45R, radii5np_12c45R, centers5np_12c45R = inscribe_circle_calc(data_5n12,data_5p12, 21792, 20210, 40175, 46036)
areas6np_12c45R, radii6np_12c45R, centers6np_12c45R = inscribe_circle_calc(data_6n12,data_6p12, 21792, 20210, 40175, 46036)

fig12_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_12c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_12c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 12 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_12c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_12c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_12c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_12c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig12_45.savefig(f"New_Foramen/Plots/Model 12/Inscr_for_area_12_c45.jpg", dpi = 300)

    #C56
areas4np_12c56L, radii4np_12c56L, centers4np_12c56L = inscribe_circle_calc(data_4n12,data_4p12, 52117, 36527, 57675, 58369)
areas5np_12c56L, radii5np_12c56L, centers5np_12c56L = inscribe_circle_calc(data_5n12,data_5p12, 52117, 36527, 57675, 58369)
areas6np_12c56L, radii6np_12c56L, centers6np_12c56L = inscribe_circle_calc(data_6n12,data_6p12, 52117, 36527, 57675, 58369)

areas4np_12c56R, radii4np_12c56R, centers4np_12c56R = inscribe_circle_calc(data_4n12,data_4p12, 65927, 40272, 62515, 79559)
areas5np_12c56R, radii5np_12c56R, centers5np_12c56R = inscribe_circle_calc(data_5n12,data_5p12, 65927, 40272, 62515, 79559)
areas6np_12c56R, radii6np_12c56R, centers6np_12c56R = inscribe_circle_calc(data_6n12,data_6p12, 65927, 40272, 62515, 79559)

fig12_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_12c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_12c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 12 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_12c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_12c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_12c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_12c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig12_56.savefig(f"New_Foramen/Plots/Model 12/Inscr_for_area_12_c56.jpg", dpi = 300)

plt.show()

      
#-------------- Model 13---------------------------------------------------------
data_4n13, data_4p13, data_5n13, data_5p13, data_6n13, data_6p13 = read_file("13")


    #C34
    
areas4np_13c34L, radii4np_13c34L, centers4np_13c34L = inscribe_circle_calc(data_4n13,data_4p13, 14886, 1297, 16439, 17116)
areas5np_13c34L, radii5np_13c34L, centers5np_13c34L = inscribe_circle_calc(data_5n13,data_5p13, 14886, 1297, 16439, 17116)
areas6np_13c34L, radii6np_13c34L, centers6np_13c34L = inscribe_circle_calc(data_6n13,data_6p13, 14886, 1297, 16439, 17116) 

areas4np_13c34R, radii4np_13c34R, centers4np_13c34R = inscribe_circle_calc(data_4n13,data_4p13, 21922, 4457, 20101, 9037)
areas5np_13c34R, radii5np_13c34R, centers5np_13c34R = inscribe_circle_calc(data_5n13,data_5p13, 21922, 4457, 20101, 9037)
areas6np_13c34R, radii6np_13c34R, centers6np_13c34R = inscribe_circle_calc(data_6n13,data_6p13, 21922, 4457, 20101, 9037)

fig13_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_13c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_13c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 13 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_13c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_13c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_13c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_13c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig13_34.savefig(f"New_Foramen/Plots/Model 13/Inscr_for_area_13_c34.jpg", dpi = 300)
 
    #C45

areas4np_13c45L, radii4np_13c45L, centers4np_13c45L = inscribe_circle_calc(data_4n13,data_4p13, 52345, 16215, 36615, 37435)
areas5np_13c45L, radii5np_13c45L, centers5np_13c45L = inscribe_circle_calc(data_5n13,data_5p13, 52345, 16215, 36615, 37435)
areas6np_13c45L, radii6np_13c45L, centers6np_13c45L = inscribe_circle_calc(data_6n13,data_6p13, 52345, 16215, 36615, 37435)

areas4np_13c45R, radii4np_13c45R, centers4np_13c45R = inscribe_circle_calc(data_4n13,data_4p13, 21792, 20210, 40175, 46036)
areas5np_13c45R, radii5np_13c45R, centers5np_13c45R = inscribe_circle_calc(data_5n13,data_5p13, 21792, 20210, 40175, 46036)
areas6np_13c45R, radii6np_13c45R, centers6np_13c45R = inscribe_circle_calc(data_6n13,data_6p13, 21792, 20210, 40175, 46036)

fig13_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_13c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_13c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 13 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_13c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_13c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_13c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_13c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig13_45.savefig(f"New_Foramen/Plots/Model 13/Inscr_for_area_13_c45.jpg", dpi = 300)

    #C56
areas4np_13c56L, radii4np_13c56L, centers4np_13c56L = inscribe_circle_calc(data_4n13,data_4p13, 52117, 36527, 57675, 58369)
areas5np_13c56L, radii5np_13c56L, centers5np_13c56L = inscribe_circle_calc(data_5n13,data_5p13, 52117, 36527, 57675, 58369)
areas6np_13c56L, radii6np_13c56L, centers6np_13c56L = inscribe_circle_calc(data_6n13,data_6p13, 52117, 36527, 57675, 58369)

areas4np_13c56R, radii4np_13c56R, centers4np_13c56R = inscribe_circle_calc(data_4n13,data_4p13, 65927, 40272, 62515, 79559)
areas5np_13c56R, radii5np_13c56R, centers5np_13c56R = inscribe_circle_calc(data_5n13,data_5p13, 65927, 40272, 62515, 79559)
areas6np_13c56R, radii6np_13c56R, centers6np_13c56R = inscribe_circle_calc(data_6n13,data_6p13, 65927, 40272, 62515, 79559)

fig13_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_13c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_13c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 13 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_13c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_13c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_13c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_13c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig13_56.savefig(f"New_Foramen/Plots/Model 13/Inscr_for_area_13_c56.jpg", dpi = 300)

plt.show()



#-------------- Model 14---------------------------------------------------------
data_4n14, data_4p14, data_5n14, data_5p14, data_6n14, data_6p14 = read_file("14")


    #C34
areas4np_14c34L, radii4np_14c34L, centers4np_14c34L = inscribe_circle_calc(data_4n14,data_4p14, 14886, 1297, 16439, 17116)
areas5np_14c34L, radii5np_14c34L, centers5np_14c34L = inscribe_circle_calc(data_5n14,data_5p14, 14886, 1297, 16439, 17116)
areas6np_14c34L, radii6np_14c34L, centers6np_14c34L = inscribe_circle_calc(data_6n14,data_6p14, 14886, 1297, 16439, 17116) 

areas4np_14c34R, radii4np_14c34R, centers4np_14c34R = inscribe_circle_calc(data_4n14,data_4p14, 21922, 4457, 20101, 9037)
areas5np_14c34R, radii5np_14c34R, centers5np_14c34R = inscribe_circle_calc(data_5n14,data_5p14, 21922, 4457, 20101, 9037)
areas6np_14c34R, radii6np_14c34R, centers6np_14c34R = inscribe_circle_calc(data_6n14,data_6p14, 21922, 4457, 20101, 9037)

fig14_34, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_14c34L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_14c34R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 14 C34: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_14c34L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_14c34R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_14c34L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_14c34R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm)')
axs[2].grid(True)
axs[2].legend()

fig14_34.savefig(f"New_Foramen/Plots/Model 14/Inscr_for_area_14_c34.jpg", dpi = 300)

    #C45
areas4np_14c45L, radii4np_14c45L, centers4np_14c45L = inscribe_circle_calc(data_4n14,data_4p14, 52345, 16215, 36615, 37435)
areas5np_14c45L, radii5np_14c45L, centers5np_14c45L = inscribe_circle_calc(data_5n14,data_5p14, 52345, 16215, 36615, 37435)
areas6np_14c45L, radii6np_14c45L, centers6np_14c45L = inscribe_circle_calc(data_6n14,data_6p14, 52345, 16215, 36615, 37435)

areas4np_14c45R, radii4np_14c45R, centers4np_14c45R = inscribe_circle_calc(data_4n14,data_4p14, 21792, 20210, 40175, 46036)
areas5np_14c45R, radii5np_14c45R, centers5np_14c45R = inscribe_circle_calc(data_5n14,data_5p14, 21792, 20210, 40175, 46036)
areas6np_14c45R, radii6np_14c45R, centers6np_14c45R = inscribe_circle_calc(data_6n14,data_6p14, 21792, 20210, 40175, 46036)

fig14_45, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_14c45L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_14c45R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 14 C45: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_14c45L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_14c45R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_14c45L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_14c45R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig14_45.savefig(f"New_Foramen/Plots/Model 14/Inscr_for_area_14_c45.jpg", dpi = 300)

    #C56
areas4np_14c56L, radii4np_14c56L, centers4np_14c56L = inscribe_circle_calc(data_4n14,data_4p14, 52117, 36527, 57675, 58369)
areas5np_14c56L, radii5np_14c56L, centers5np_14c56L = inscribe_circle_calc(data_5n14,data_5p14, 52117, 36527, 57675, 58369)
areas6np_14c56L, radii6np_14c56L, centers6np_14c56L = inscribe_circle_calc(data_6n14,data_6p14, 52117, 36527, 57675, 58369)

areas4np_14c56R, radii4np_14c56R, centers4np_14c56R = inscribe_circle_calc(data_4n14,data_4p14, 65927, 40272, 62515, 79559)
areas5np_14c56R, radii5np_14c56R, centers5np_14c56R = inscribe_circle_calc(data_5n14,data_5p14, 65927, 40272, 62515, 79559)
areas6np_14c56R, radii6np_14c56R, centers6np_14c56R = inscribe_circle_calc(data_6n14,data_6p14, 65927, 40272, 62515, 79559)

fig14_56, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)


axs[0].plot(t, areas4np_14c56L, label='Left Foramen', color = 'green')
axs[0].plot(t, areas4np_14c56R, label='Right Foramen', color = 'red')
axs[0].set_title('Model 14 C56: Flexion/Extension Inscribed Foramen Area')
axs[0].set_ylabel('Area (mm^2)')
axs[0].grid(True)
axs[0].legend()


axs[1].plot(t, areas5np_14c56L, label='Left Foramen', color = 'green')
axs[1].plot(t, areas5np_14c56R, label='Right Foramen', color = 'red')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('Area (mm^2)')
axs[1].grid(True)
axs[1].legend()


axs[2].plot(t, areas6np_14c56L, label='Left Foramen', color = 'green')
axs[2].plot(t, areas6np_14c56R, label='Right Foramen', color = 'red')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time (s)')
axs[2].set_ylabel('Area (mm^2)')
axs[2].grid(True)
axs[2].legend()

fig14_56.savefig(f"New_Foramen/Plots/Model 14/Inscr_for_area_14_c56.jpg", dpi = 300)
"""
plt.show()


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import itertools
import tkinter as tk
from tkinter import filedialog
from pathlib import Path
#authors: @amladow

#========================================================================================================================
#This file is for calculating and plotting the finite center of rotation of the C4-C5 disc region,
#with data coming from an Abuqus FE model. Data was pulled by Alyssa Brayer and Andrew Tritle and put into .xlsx format
#========================================================================================================================

def read_file(model):

    data_path = (f'New_CenterOfRotation/Finite_COR/Data Files/Model {model} Y_Z Data.xlsx')
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None)
    #Get node labels
    node_labels = df_all.iloc[0].dropna().tolist()  # row 4 (index=3 in zero-based)
    print("Node Labels Found:", node_labels)

    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None, skiprows = 2)
    data_n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4]
        data_n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
    
    #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="4P", header=None, skiprows = 2)
    data_p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4]
        data_p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
    
    print("Data Read Succesfully")
    return data_n, data_p


def fcor_slice(y_n_left, y_p_left, z_n_left, z_p_left,
               y_n_right, y_p_right, z_n_right, z_p_right,
               start, length):

    sl = slice(start, start + length) #splits given data into desired "chunks"

    #Putting n and p data into one array so full range of motion is plotted
    y_data_left  = np.concatenate((np.flip(y_n_left[sl]),  y_p_left[sl][1:]))
    z_data_left  = np.concatenate((np.flip(z_n_left[sl]),  z_p_left[sl][1:]))
    y_data_right = np.concatenate((np.flip(y_n_right[sl]), y_p_right[sl][1:]))
    z_data_right = np.concatenate((np.flip(z_n_right[sl]), z_p_right[sl][1:]))

    #Complexify the data
    A = y_data_left + 1j * z_data_left
    B = y_data_right + 1j * z_data_right

    #Calculate the mean
    meanA = A.mean()
    meanB = B.mean()

    #Translate pointsets to the origin
    A2 = A - meanA
    B2 = B - meanB

    #.conj gets the matrices conjugate, least squares solution to get the angle
    x = (B2.conj() @ A2) / (B2.conj() @ B2)
    theta = np.angle(x)
    scale = np.abs(x)

    #Defining optimal rotation matrix
    R = np.array([
        [np.cos(theta), -np.sin(theta)],
        [np.sin(theta),  np.cos(theta)]
    ])

    #Optimal translation vector
    v = np.array([meanA.real, meanA.imag]) - np.array([meanB.real, meanB.imag]) @ R.T

    denom = np.tan(theta / 2)
    if np.abs(denom) < 1e-6:
        return None, scale, theta

    fcr = np.zeros((2,1))
    fcr[0,0] = (v[0] - v[1] / denom) / 2
    fcr[1,0] = (v[1] + v[0] / denom) / 2

    return fcr, scale, theta


def calculate_FCOR(data_n, data_p):

    y_n_left = data_n["Node 49903"]["y_vals"]
    y_p_left = data_p["Node 49903"]["y_vals"]
    z_n_left = data_n["Node 49903"]["z_vals"]
    z_p_left = data_p["Node 49903"]["z_vals"]

    y_n_right = data_n["Node 45615"]["y_vals"]
    y_p_right = data_p["Node 45615"]["y_vals"]
    z_n_right = data_n["Node 45615"]["z_vals"]
    z_p_right = data_p["Node 45615"]["z_vals"]

    N = len(y_n_left)
    split = N // 4

    fcr_all = []
    theta_all = []
    scale_all = []

    for i in range(4):
        start = i * split #start index at desired spot

        fcr, scale, theta = fcor_slice(y_n_left, y_p_left, z_n_left, z_p_left,
                                       y_n_right,y_p_right, z_n_right, z_p_right,
                                       start, split)

        if fcr is not None:
            fcr_all.append(fcr)
            theta_all.append(theta)
            scale_all.append(scale)


    return fcr_all, scale_all, theta_all


data_n, data_p = read_file("15")
fcr15, scale15, theta15 = calculate_FCOR(data_n,data_p)
print("Scale Values: ", scale15)
print("Angle vals (deg): ", np.rad2deg(theta15))

fcr15 = np.hstack(fcr15)   # shape (2, 4)
y_vals = fcr15[0, :]
z_vals = fcr15[1, :]
print("Y Coords: " , y_vals)
print("Z Coords: " , z_vals)
x_vals = np.linspace(-20,20, len(y_vals))

plt.figure()
plt.plot(x_vals, y_vals, marker='o', label='y')
plt.plot(x_vals, z_vals, marker='o', label='z')
plt.xlabel('Moment')
plt.ylabel('Displacement from Origin (mm)')
plt.legend()
plt.grid(True)
plt.show()

#data_n, data_p = read_file("14")
#fcr14, scale14, theta14 = calculate_FCOR(data_n,data_p)
#print(fcr14)
#print(scale14)
#print(theta14)

#data_n1, data_p1 = read_file("13")
#fcr13, scale13, theta13 = calculate_FCOR(data_n1, data_p1)
#print(fcr13)
#print(scale13)
#print(theta13)

#data_n1, data_p1 = read_file("12")
#fcr12, scale12, theta12 = calculate_FCOR(data_n1, data_p1)
#print(fcr12)
#print(scale12)
#print(theta12)

#data_n1, data_p1 = read_file("11")
#fcr11, scale11, theta11 = calculate_FCOR(data_n1, data_p1)
#print(fcr11)
#print(scale11)
#print(theta11)

#data_n1, data_p1 = read_file("10")
#fcr10, scale10, theta10 = calculate_FCOR(data_n1, data_p1)
#print(fcr10)
#print(scale10)
#print(theta10)

#data_n1, data_p1 = read_file("9")
#fcr9, scale9, theta9 = calculate_FCOR(data_n1, data_p1)
#print(fcr9)
#print(scale9)
#print(theta9)

#data_n1, data_p1 = read_file("8")
#fcr8, scale8, theta8 = calculate_FCOR(data_n1, data_p1)
#print(fcr8)
#print(scale8)
#print(theta8)

#data_n1, data_p1 = read_file("7")
#fcr7, scale7, theta7 = calculate_FCOR(data_n1, data_p1)
#print(fcr7)
#print(scale7)
#print(theta7)

#data_n1, data_p1 = read_file("6")
#fcr6, scale6, theta6 = calculate_FCOR(data_n1, data_p1)
#print(fcr6)
#print(scale6)
#print(theta6)

#data_n1, data_p1 = read_file("5")
#fcr5, scale5, theta5 = calculate_FCOR(data_n1, data_p1)
#print(fcr5)
#print(scale5)
#print(theta5)

#data_n1, data_p1 = read_file("4")
#fcr4, scale4, theta4 = calculate_FCOR(data_n1, data_p1)
#print(fcr4)
#print(scale4)
#print(theta4)

#data_n1, data_p1 = read_file("3")
#fcr3, scale3, theta3 = calculate_FCOR(data_n1, data_p1)
#print(fcr3)
#print(scale3)
#print(theta3)

#data_n1, data_p1 = read_file("2")
#fcr2, scale2, theta2 = calculate_FCOR(data_n1, data_p1)
#print(fcr2)
#print(scale2)
#print(theta2)

#data_n1, data_p1 = read_file("1")
#fcr1, scale1, theta1 = calculate_FCOR(data_n1, data_p1)
#print(fcr1)
#print(scale1)
#print(theta1)
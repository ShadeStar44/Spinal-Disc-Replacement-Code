import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import itertools
import tkinter as tk
from tkinter import filedialog
from pathlib import Path
from scipy import linalg
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

    orig_coords = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[3, i*5: (i+1) *5]
        orig_coords[label] = {
            "x_val": float(cols.iloc[1]),
            "y_val": float(cols.iloc[2]),
            "z_val": float(cols.iloc[3])
        }


    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None, skiprows = 2)
    data_4n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4] 
        data_4n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
        data_4n[label]["x_vals"] = orig_coords[label]["x_val"] + data_4n[label]["x_vals"]
        data_4n[label]["y_vals"] = orig_coords[label]["y_val"] + data_4n[label]["y_vals"]
        data_4n[label]["z_vals"] = orig_coords[label]["z_val"] + data_4n[label]["z_vals"]

    #Reading 'P' dta
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
    return data_4n, data_p

def read_file45_1(model):

    data_path = (f'New_CenterOfRotation/Finite_COR/Data Files/C45_Data/Model {model} Y_Z Data.xlsx')
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None)
    #Get node labels
    node_labels = df_all.iloc[2].dropna().tolist()  # row 3  
    print("Node Labels Found:", node_labels) 

    orig_coords = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[3, i*5: (i+1) *5]
        orig_coords[label] = {
            "x_val": float(cols.iloc[1]),
            "y_val": float(cols.iloc[2]),
            "z_val": float(cols.iloc[3])
        }
    print('Orig Coords:', orig_coords)
    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None, skiprows = 5)
    data_4n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_4n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_4n[label]["y_vals"] = orig_coords[label]["y_val"] + data_4n[label]["y_vals"]
        data_4n[label]["z_vals"] = orig_coords[label]["z_val"] + data_4n[label]["z_vals"]

    #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="4P", header=None, skiprows = 5)
    data_4p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5]
        data_4p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_4p[label]["y_vals"] = orig_coords[label]["y_val"] + data_4p[label]["y_vals"]
        data_4p[label]["z_vals"] = orig_coords[label]["z_val"] + data_4p[label]["z_vals"]

        #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None, skiprows = 5)
    data_5n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_5n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_5n[label]["x_vals"] = orig_coords[label]["x_val"] + data_5n[label]["x_vals"]
        data_5n[label]["z_vals"] = orig_coords[label]["z_val"] + data_5n[label]["z_vals"]
        #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="5P", header=None, skiprows = 5)
    data_5p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5]
        data_5p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_5p[label]["x_vals"] = orig_coords[label]["x_val"] + data_5p[label]["x_vals"]
        data_5p[label]["z_vals"] = orig_coords[label]["z_val"] + data_5p[label]["z_vals"]

    print("Data Read Succesfully")
    return data_4n, data_4p, data_5n, data_5p

def read_file45_3(model):

    data_path = (f'New_CenterOfRotation/Finite_COR/Data Files/C45_Data/Model {model} Y_Z Data.xlsx')
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None)
    #Get node labels
    node_labels = df_all.iloc[2].dropna().tolist()  # row 3  
    print("Node Labels Found:", node_labels) 

    orig_coords = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[3, i*5: (i+1) *5]
        orig_coords[label] = {
            "x_val": float(cols.iloc[1]),
            "y_val": float(cols.iloc[2]),
            "z_val": float(cols.iloc[3])
        }
    print('Orig Coords:', orig_coords)
    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None, skiprows = 2)
    data_4n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4] 
        data_4n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        }
        data_4n[label]["y_vals"] = orig_coords[label]["y_val"] + data_4n[label]["y_vals"]
        data_4n[label]["z_vals"] = orig_coords[label]["z_val"] + data_4n[label]["z_vals"]
    
    #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="4P", header=None, skiprows = 2)
    data_4p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4]
        data_4p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
        data_4p[label]["y_vals"] = orig_coords[label]["y_val"] + data_4p[label]["y_vals"]
        data_4p[label]["z_vals"] = orig_coords[label]["z_val"] + data_4p[label]["z_vals"]

        #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None, skiprows = 5)
    data_5n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_5n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_5n[label]["x_vals"] = orig_coords[label]["x_val"] + data_5n[label]["x_vals"]
        data_5n[label]["z_vals"] = orig_coords[label]["z_val"] + data_5n[label]["z_vals"]

        #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="5P", header=None, skiprows = 5)
    data_5p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5]
        data_5p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_5p[label]["x_vals"] = orig_coords[label]["x_val"] + data_5p[label]["x_vals"]
        data_5p[label]["z_vals"] = orig_coords[label]["z_val"] + data_5p[label]["z_vals"]
 
    print("Data Read Succesfully")
    return data_4n, data_4p, data_5n, data_5p

def read_file45_15(model):

    data_path = (f'New_CenterOfRotation/Finite_COR/Data Files/C45_Data/Model {model} Y_Z Data.xlsx')
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None)
    #Get node labels
    node_labels = df_all.iloc[2].dropna().tolist()  # row 3  
    print("Node Labels Found:", node_labels) 
    

    orig_coords = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[3, i*5: (i+1) *5]
        orig_coords[label] = {
            "x_val": float(cols.iloc[1]),
            "y_val": float(cols.iloc[2]),
            "z_val": float(cols.iloc[3])
        }
    print('Orig Coords:', orig_coords)

    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None, skiprows = 5)
    data_4n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_4n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_4n[label]["y_vals"] = orig_coords[label]["y_val"] + data_4n[label]["y_vals"]
        data_4n[label]["z_vals"] = orig_coords[label]["z_val"] + data_4n[label]["z_vals"]

    #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="4P", header=None, skiprows = 2)
    data_4p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4]
        data_4p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
        data_4p[label]["y_vals"] = orig_coords[label]["y_val"] + data_4p[label]["y_vals"]
        data_4p[label]["z_vals"] = orig_coords[label]["z_val"] + data_4p[label]["z_vals"]

        #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None, skiprows = 5)
    data_5n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_5n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_5n[label]["x_vals"] = orig_coords[label]["x_val"] + data_5n[label]["x_vals"]
        data_5n[label]["z_vals"] = orig_coords[label]["z_val"] + data_5n[label]["z_vals"]
        #Reading 'P' data

    df_all = pd.read_excel(data_path, sheet_name="5P", header=None, skiprows = 5)
    data_5p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5]
        data_5p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
        data_5p[label]["x_vals"] = orig_coords[label]["x_val"] + data_5p[label]["x_vals"]
        data_5p[label]["z_vals"] = orig_coords[label]["z_val"] + data_5p[label]["z_vals"]
 
    print("Data Read Succesfully")
    return data_4n, data_4p, data_5n, data_5p

def read_file34_1(model):

    data_path = (f'New_CenterOfRotation/Finite_COR/Data Files/C34_Data/Y_Z Data Model {model}-C34.xlsx')
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None)
    #Get node labels
    node_labels = df_all.iloc[2].dropna().tolist()  # row 3  
    print("Node Labels Found:", node_labels) 
 
    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None, skiprows = 5)
    data_4n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4] 
        data_4n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
    
    #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="4P", header=None, skiprows = 5)
    data_4p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4]
        data_4p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
    

        #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None, skiprows = 5)
    data_5n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_5n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 

        #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="5P", header=None, skiprows = 5)
    data_5p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5]
        data_5p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 

 
    print("Data Read Succesfully")
    return data_4n, data_4p, data_5n, data_5p

def read_file34_15(model):

    data_path = (f'New_CenterOfRotation/Finite_COR/Data Files/C34_Data/Y_Z Data Model {model}-C34.xlsx')
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None)
    #Get node labels
    node_labels = df_all.iloc[2].dropna().tolist()  # row 3  
    print("Node Labels Found:", node_labels) 
 
    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None, skiprows = 5)
    data_4n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4] 
        data_4n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
    
    #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="4P", header=None, skiprows = 5)
    data_4p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4]
        data_4p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
    

        #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None, skiprows = 5)
    data_5n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4] 
        data_5n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 

        #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="5P", header=None, skiprows = 5)
    data_5p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4]
        data_5p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 

 
    print("Data Read Succesfully")
    return data_4n, data_4p, data_5n, data_5p

def read_file34_4(model):

    data_path = (f'New_CenterOfRotation/Finite_COR/Data Files/C34_Data/Y_Z Data Model {model}-C34.xlsx')
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None)
    #Get node labels
    node_labels = df_all.iloc[2].dropna().tolist()  # row 3  
    print("Node Labels Found:", node_labels) 
 
    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None, skiprows = 5)
    data_4n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4] 
        data_4n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
    
    #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="4P", header=None, skiprows = 5)
    data_4p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4]
        data_4p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
    

        #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None, skiprows = 5)
    data_5n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_5n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        }

        #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="5P", header=None, skiprows = 5)
    data_5p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5]
        data_5p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 

 
    print("Data Read Succesfully")
    return data_4n, data_4p, data_5n, data_5p

def read_file56_15(model):

    data_path = (f'New_CenterOfRotation/Finite_COR/Data Files/C56_Data/Y_Z Data Model {model}-C56.xlsx')
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None)
    #Get node labels
    node_labels = df_all.iloc[2].dropna().tolist()  # row 3  
    print("Node Labels Found:", node_labels) 
 
    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None, skiprows = 5)
    data_4n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4] 
        data_4n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
    
    #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="4P", header=None, skiprows = 5)
    data_4p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4]
        data_4p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "y_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 
    

        #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None, skiprows = 5)
    data_5n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4] 
        data_5n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 

        #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="5P", header=None, skiprows = 5)
    data_5p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*4:(i+1)*4]
        data_5p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "z_vals": cols.iloc[:, 2].to_numpy()
        } 

 
    print("Data Read Succesfully")
    return data_4n, data_4p, data_5n, data_5p

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
    x = (B2.conj() @ A2)
    theta = np.angle(x)
    scale = 1.00

    #Defining optimal rotation matrix
    R = np.array([
        [np.cos(theta), -np.sin(theta)],
        [np.sin(theta),  np.cos(theta)]
    ])
    """
    #Optimal translation vector
    v = np.array([meanA.real, meanA.imag]) - np.array([meanB.real, meanB.imag]) @ R.T

    denom = np.tan(theta / 2)
    if np.abs(denom) < 1e-6:
        return None, scale, theta

    fcr = np.zeros((2,1))
    fcr[0,0] = (v[0] - v[1] / denom) / 2
    fcr[1,0] = (v[1] + v[0] / denom) / 2

    
    return fcr, scale, theta
    """
    meanA_vec = np.array([meanA.real, meanA.imag])
    meanB_vec = np.array([meanB.real, meanB.imag])

    # Translation vector for A = R B + t
    t = meanA_vec - R @ meanB_vec

    I = np.eye(2)
    M = I - R

    # Detect pure translation
    if np.linalg.cond(M) > 1e6:
        return None, scale, theta

    fcr = np.linalg.solve(M, t).reshape(2, 1)

    return fcr, scale, theta
    


def calculate_FCOR_4n4p(data_n, data_p):

    y_n_left = data_n[ 49903]["y_vals"]
    y_p_left = data_p[ 49903]["y_vals"]
    z_n_left = data_n[ 49903]["z_vals"]
    z_p_left = data_p[ 49903]["z_vals"]

    y_n_right = data_n[ 29005]["y_vals"]
    y_p_right = data_p[ 29005]["y_vals"]
    z_n_right = data_n[ 29005]["z_vals"]
    z_p_right = data_p[ 29005]["z_vals"]

    N = len(y_n_left)
    print(N)
    split = N // 5

    fcr_all = []
    theta_all = []
    scale_all = []

    for i in range(5):
        start = i * split #start index at desired spot

        fcr, scale, theta = fcor_slice(y_n_left, y_p_left, z_n_left, z_p_left,
                                       y_n_right,y_p_right, z_n_right, z_p_right,
                                       start, split)

        if fcr is not None:
            fcr_all.append(fcr)
            theta_all.append(theta)
            scale_all.append(scale)


    return fcr_all, scale_all, theta_all



def calculate_FCOR_5n5p(data_n, data_p):

    x_n_left = data_n[ 52027]["x_vals"]
    x_p_left = data_p[ 52027]["x_vals"]
    z_n_left = data_n[ 52027]["z_vals"]
    z_p_left = data_p[ 52027]["z_vals"]

    x_n_right = data_n[ 31067]["x_vals"]
    x_p_right = data_p[ 31067]["x_vals"]
    z_n_right = data_n[ 31067]["z_vals"]
    z_p_right = data_p[ 31067]["z_vals"]

    N = len(x_n_left)
    print(N)
    split = N // 5

    fcr_all = []
    theta_all = []
    scale_all = []

    for i in range(5):
        start = i * split #start index at desired spot

        fcr, scale, theta = fcor_slice(x_n_left, x_p_left, z_n_left, z_p_left,
                                       x_n_right,x_p_right, z_n_right, z_p_right,
                                       start, split)

        if fcr is not None:
            fcr_all.append(fcr)
            theta_all.append(theta)
            scale_all.append(scale)


    return fcr_all, scale_all, theta_all

def calculate_FCOR_4n4p_C34(data_n, data_p):

    y_n_left = data_n[ 13917]["y_vals"]
    y_p_left = data_p[ 13917]["y_vals"]
    z_n_left = data_n[ 13917]["z_vals"]
    z_p_left = data_p[ 13917]["z_vals"]

    y_n_right = data_n[ 31579]["y_vals"]
    y_p_right = data_p[ 31579]["y_vals"]
    z_n_right = data_n[ 31579]["z_vals"]
    z_p_right = data_p[ 31579]["z_vals"]

    N = len(y_n_left)
    print(N)
    split = N // 5

    fcr_all = []
    theta_all = []
    scale_all = []

    for i in range(5):
        start = i * split #start index at desired spot

        fcr, scale, theta = fcor_slice(y_n_left, y_p_left, z_n_left, z_p_left,
                                       y_n_right,y_p_right, z_n_right, z_p_right,
                                       start, split)

        if fcr is not None:
            fcr_all.append(fcr)
            theta_all.append(theta)
            scale_all.append(scale)


    return fcr_all, scale_all, theta_all

def calculate_FCOR_5n5p_C34(data_n, data_p):

    x_n_left = data_n[ 13917]["x_vals"]
    x_p_left = data_p[ 13917]["x_vals"]
    z_n_left = data_n[ 13917]["z_vals"]
    z_p_left = data_p[ 13917]["z_vals"]

    x_n_right = data_n[ 31579]["x_vals"]
    x_p_right = data_p[ 31579]["x_vals"]
    z_n_right = data_n[ 31579]["z_vals"]
    z_p_right = data_p[ 31579]["z_vals"]

    N = len(x_n_left)
    print(N)
    split = N // 5

    fcr_all = []
    theta_all = []
    scale_all = []

    for i in range(5):
        start = i * split #start index at desired spot

        fcr, scale, theta = fcor_slice(x_n_left, x_p_left, z_n_left, z_p_left,
                                       x_n_right,x_p_right, z_n_right, z_p_right,
                                       start, split)

        if fcr is not None:
            fcr_all.append(fcr)
            theta_all.append(theta)
            scale_all.append(scale)


    return fcr_all, scale_all, theta_all


def calculate_FCOR_4n4p_C56(data_n, data_p):

    y_n_left = data_n[ 51195]["y_vals"]
    y_p_left = data_p[ 51195]["y_vals"]
    z_n_left = data_n[ 51195]["z_vals"]
    z_p_left = data_p[ 51195]["z_vals"]

    y_n_right = data_n[ 79455]["y_vals"]
    y_p_right = data_p[ 79455]["y_vals"]
    z_n_right = data_n[ 79455]["z_vals"]
    z_p_right = data_p[ 79455]["z_vals"]

    N = len(y_n_left)
    print(N)
    split = N // 5

    fcr_all = []
    theta_all = []
    scale_all = []

    for i in range(5):
        start = i * split #start index at desired spot

        fcr, scale, theta = fcor_slice(y_n_left, y_p_left, z_n_left, z_p_left,
                                       y_n_right,y_p_right, z_n_right, z_p_right,
                                       start, split)

        if fcr is not None:
            fcr_all.append(fcr)
            theta_all.append(theta)
            scale_all.append(scale)


    return fcr_all, scale_all, theta_all

def calculate_FCOR_5n5p_C56(data_n, data_p):

    x_n_left = data_n[ 48021]["x_vals"]
    x_p_left = data_p[ 48021]["x_vals"]
    z_n_left = data_n[ 48021]["z_vals"]
    z_p_left = data_p[ 48021]["z_vals"]

    x_n_right = data_n[ 75173]["x_vals"]
    x_p_right = data_p[ 75173]["x_vals"]
    z_n_right = data_n[ 75173]["z_vals"]
    z_p_right = data_p[ 75173]["z_vals"]

    N = len(x_n_left)
    print(N)
    split = N // 5

    fcr_all = []
    theta_all = []
    scale_all = []

    for i in range(5):
        start = i * split #start index at desired spot

        fcr, scale, theta = fcor_slice(x_n_left, x_p_left, z_n_left, z_p_left,
                                       x_n_right,x_p_right, z_n_right, z_p_right,
                                       start, split)

        if fcr is not None:
            fcr_all.append(fcr)
            theta_all.append(theta)
            scale_all.append(scale)


    return fcr_all, scale_all, theta_all


# ------ C4-5 COR Values ------
"""

data_4n15, data_4p15, data_5n15, data_5p15= read_file45_15("15")
fcr15_4, scale15_4, theta15_4 = calculate_FCOR_4n4p(data_4n15, data_4p15)
fcr15_5, scale15_5, theta15_5 = calculate_FCOR_5n5p(data_5n15, data_5p15)
print("Scale Values: ", scale15_5)
print("Angle vals (deg): ", np.rad2deg(theta15_5))

fcr15_4 = np.hstack(fcr15_4) 
y_vals15_4 = fcr15_4[0, :]
z_vals15_4 = fcr15_4[1, :]
print("Y Coords: " , y_vals15_4)
print("Z Coords: " , z_vals15_4)
x_vals = np.linspace(0,0, len(y_vals15_4))

fig15_4 = plt.figure(5,figsize=(10,8))
ax15_4 = fig15_4.add_subplot(111,projection='3d')
fig15_4.canvas.manager.set_window_title('Model 15 C45 4n/4p')
ax15_4.scatter(x_vals,y_vals15_4,z_vals15_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals15_4)):
    ax15_4.text(
        x_vals[i], 
        y_vals15_4[i], 
        z_vals15_4[i],
        f"{i}:({x_vals[i]:.2f}, {y_vals15_4[i]:.2f}, {z_vals15_4[i]:.2f})",
        fontsize=8
    )

ax15_4.set_xlabel("X-Axis (Locked)")
ax15_4.set_ylabel("Y-Axis (mm)")
ax15_4.set_zlabel("Z-Axis (mm)")
ax15_4.set_title("Model 15 C45 4n/4p")
plt.show()
fig15_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 15/C45/Model_15_COR_4N4P.png', dpi = 300)

fcr15_5 = np.hstack(fcr15_5) 
x_vals15_5 = fcr15_5[0, :]
z_vals15_5 = fcr15_5[1, :]
print("X Coords: " , x_vals15_5)
print("Z Coords: " , z_vals15_5)

y_vals = np.linspace(0,0, len(x_vals15_5))
fig15_5 = plt.figure(5,figsize=(10,8))
ax15_5 = fig15_5.add_subplot(111,projection='3d')
fig15_5.canvas.manager.set_window_title('Model 15 C45 5n/5p')
ax15_5.scatter(y_vals,x_vals15_5,z_vals15_5, c = 'r', marker = 'o')


for i in range(len(x_vals15_5)):
    ax15_5.text(
        y_vals[i], 
        x_vals15_5[i], 
        z_vals15_5[i],
        f"{i}:({x_vals15_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals15_5[i]:.2f})",
        fontsize=8
    )

ax15_5.set_xlabel("Y-Axis (locked)")
ax15_5.set_ylabel("X-Axis (mm)")
ax15_5.set_zlabel("Z-Axis (mm)")
ax15_5.set_title("Model 15 C45 5n/5p")

plt.show()
fig15_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 15/C45/Model_15_COR_5N5P.png', dpi = 300)



data_4n14, data_4p14, data_5n14, data_5p14= read_file45_3("14")
fcr14_4, scale14_4, theta14_4 = calculate_FCOR_4n4p(data_4n14, data_4p14)
fcr14_5, scale14_5, theta14_5 = calculate_FCOR_5n5p(data_5n14, data_5p14)
print("Scale Values: ", scale14_5)
print("Angle vals (deg): ", np.rad2deg(theta14_5))

fcr14_4 = np.hstack(fcr14_4) 
y_vals14_4 = fcr14_4[0, :]
z_vals14_4 = fcr14_4[1, :]
print("Y Coords: " , y_vals14_4)
print("Z Coords: " , z_vals14_4)
x_vals = np.linspace(0,0, len(y_vals14_4))

fig14_4 = plt.figure(5,figsize=(10,8))
ax14_4 = fig14_4.add_subplot(111,projection='3d')
fig14_4.canvas.manager.set_window_title('Model 14 C45 4n/4p')
ax14_4.scatter(x_vals,y_vals14_4,z_vals14_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals14_4)):
    ax14_4.text(
        x_vals[i], 
        y_vals14_4[i], 
        z_vals14_4[i],
        f"{i}:({x_vals[i]:.2f}, {y_vals14_4[i]:.2f}, {z_vals14_4[i]:.2f})",
        fontsize=8
    )

ax14_4.set_xlabel("X-Axis (Locked)")
ax14_4.set_ylabel("Y-Axis (mm)")
ax14_4.set_zlabel("Z-Axis (mm)")
ax14_4.set_title("Model 14 C45 4n/4p")
plt.show()
fig14_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 14/C45/Model_14_COR_4N4P.png', dpi = 300)

fcr14_5 = np.hstack(fcr14_5) 
x_vals14_5 = fcr14_5[0, :]
z_vals14_5 = fcr14_5[1, :]
print("X Coords: " , x_vals14_5)
print("Z Coords: " , z_vals14_5)

y_vals = np.linspace(0,0, len(x_vals14_5))
fig14_5 = plt.figure(5,figsize=(10,8))
ax14_5 = fig14_5.add_subplot(111,projection='3d')
fig14_5.canvas.manager.set_window_title('Model 14 C45 5n/5p')
ax14_5.scatter(y_vals,x_vals14_5,z_vals14_5, c = 'r', marker = 'o')


for i in range(len(x_vals14_5)):
    ax14_5.text(
        y_vals[i], 
        x_vals14_5[i], 
        z_vals14_5[i],
        f"{i}:({x_vals14_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals14_5[i]:.2f})",
        fontsize=8
    )

ax14_5.set_xlabel("Y-Axis (locked)")
ax14_5.set_ylabel("X-Axis (mm)")
ax14_5.set_zlabel("Z-Axis (mm)")
ax14_5.set_title("Model 14 C45 5n/5p")

plt.show()
fig14_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 14/C45/Model_14_COR_5N5P.png', dpi = 300)




data_4n5, data_4p5, data_5n5, data_5p5= read_file45_3("5")
fcr5_4, scale5_4, theta5_4 = calculate_FCOR_4n4p(data_4n5, data_4p5)
fcr5_5, scale5_5, theta5_5 = calculate_FCOR_5n5p(data_5n5, data_5p5)
print("Scale Values: ", scale5_5)
print("Angle vals (deg): ", np.rad2deg(theta5_5))

fcr5_4 = np.hstack(fcr5_4) 
y_vals5_4 = fcr5_4[0, :]
z_vals5_4 = fcr5_4[1, :]
print("Y Coords: " , y_vals5_4)
print("Z Coords: " , z_vals5_4)
x_vals = np.linspace(0,0, len(y_vals5_4))

fig5_4 = plt.figure(5,figsize=(10,8))
ax5_4 = fig5_4.add_subplot(111,projection='3d')
fig5_4.canvas.manager.set_window_title('Model 5 C45 4n/4p')
ax5_4.scatter(x_vals,y_vals5_4,z_vals5_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals5_4)):
    ax5_4.text(
        x_vals[i], 
        y_vals5_4[i], 
        z_vals5_4[i],
        f"{i}:({x_vals[i]:.2f}, {y_vals5_4[i]:.2f}, {z_vals5_4[i]:.2f})",
        fontsize=8
    )

ax5_4.set_xlabel("X-Axis (Locked)")
ax5_4.set_ylabel("Y-Axis (mm)")
ax5_4.set_zlabel("Z-Axis (mm)")
ax5_4.set_title("Model 5 C45 4n/4p")
plt.show()
fig5_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 5/C45/Model_5_COR_4N4P.png', dpi = 300)

fcr5_5 = np.hstack(fcr5_5) 
x_vals5_5 = fcr5_5[0, :]
z_vals5_5 = fcr5_5[1, :]
print("X Coords: " , x_vals5_5)
print("Z Coords: " , z_vals5_5)

y_vals = np.linspace(0,0, len(x_vals5_5))
fig5_5 = plt.figure(5,figsize=(10,8))
ax5_5 = fig5_5.add_subplot(111,projection='3d')
fig5_5.canvas.manager.set_window_title('Model 5 C45 5n/5p')
ax5_5.scatter(y_vals,x_vals5_5,z_vals5_5, c = 'r', marker = 'o')


for i in range(len(x_vals5_5)):
    ax5_5.text(
        y_vals[i], 
        x_vals5_5[i], 
        z_vals5_5[i],
        f"{i}:({x_vals5_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals5_5[i]:.2f})",
        fontsize=8
    )

ax5_5.set_xlabel("Y-Axis (locked)")
ax5_5.set_ylabel("X-Axis (mm)")
ax5_5.set_zlabel("Z-Axis (mm)")
ax5_5.set_title("Model 5 C45 5n/5p")

plt.show()
fig5_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 5/C45/Model_5_COR_5N5P.png', dpi = 300)


data_4n4, data_4p4, data_5n4, data_5p4= read_file45_3("4")
fcr4_4, scale4_4, theta4_4 = calculate_FCOR_4n4p(data_4n4, data_4p4)
fcr4_5, scale4_5, theta4_5 = calculate_FCOR_5n5p(data_5n4, data_5p4)
print("Scale Values: ", scale4_5)
print("Angle vals (deg): ", np.rad2deg(theta4_5))

fcr4_4 = np.hstack(fcr4_4) 
y_vals4_4 = fcr4_4[0, :]
z_vals4_4 = fcr4_4[1, :]
print("Y Coords: " , y_vals4_4)
print("Z Coords: " , z_vals4_4)
x_vals = np.linspace(0,0, len(y_vals4_4))

fig4_4 = plt.figure(5,figsize=(10,8))
ax4_4 = fig4_4.add_subplot(111,projection='3d')
fig4_4.canvas.manager.set_window_title('Model 4 C45 4n/4p')
ax4_4.scatter(x_vals,y_vals4_4,z_vals4_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals4_4)):
    ax4_4.text(
        x_vals[i], 
        y_vals4_4[i], 
        z_vals4_4[i],
        f"{i}:({x_vals[i]:.2f}, {y_vals4_4[i]:.2f}, {z_vals4_4[i]:.2f})",
        fontsize=8
    )

ax4_4.set_xlabel("X-Axis (Locked)")
ax4_4.set_ylabel("Y-Axis (mm)")
ax4_4.set_zlabel("Z-Axis (mm)")
ax4_4.set_title("Model 4 C45 4n/4p")
plt.show()
fig4_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 4/C45/Model_4_COR_4N4P.png', dpi = 300)

fcr4_5 = np.hstack(fcr4_5) 
x_vals4_5 = fcr4_5[0, :]
z_vals4_5 = fcr4_5[1, :]
print("X Coords: " , x_vals4_5)
print("Z Coords: " , z_vals4_5)

y_vals = np.linspace(0,0, len(x_vals4_5))
fig4_5 = plt.figure(5,figsize=(10,8))
ax4_5 = fig4_5.add_subplot(111,projection='3d')
fig4_5.canvas.manager.set_window_title('Model 4 C45 5n/5p')
ax4_5.scatter(y_vals,x_vals4_5,z_vals4_5, c = 'r', marker = 'o')


for i in range(len(x_vals4_5)):
    ax4_5.text(
        y_vals[i], 
        x_vals4_5[i], 
        z_vals4_5[i],
        f"{i}:({x_vals4_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals4_5[i]:.2f})",
        fontsize=8
    )

ax4_5.set_xlabel("Y-Axis (locked)")
ax4_5.set_ylabel("X-Axis (mm)")
ax4_5.set_zlabel("Z-Axis (mm)")
ax4_5.set_title("Model 4 C45 5n/5p")

plt.show()
fig4_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 4/C45/Model_4_COR_5N5P.png', dpi = 300)


data_4n3, data_4p3, data_5n3, data_5p3= read_file45_3("3")
fcr3_4, scale3_4, theta3_4 = calculate_FCOR_4n4p(data_4n3, data_4p3)
fcr3_5, scale3_5, theta3_5 = calculate_FCOR_5n5p(data_5n3, data_5p3)
print("Scale Values: ", scale3_5)
print("Angle vals (deg): ", np.rad2deg(theta3_5))

fcr3_4 = np.hstack(fcr3_4) 
y_vals3_4 = fcr3_4[0, :]
z_vals3_4 = fcr3_4[1, :]
print("Y Coords: " , y_vals3_4)
print("Z Coords: " , z_vals3_4)
x_vals = np.linspace(0,0, len(y_vals3_4))

fig3_4 = plt.figure(5,figsize=(10,8))
ax3_4 = fig3_4.add_subplot(111,projection='3d')
fig3_4.canvas.manager.set_window_title('Model 1 C45 4n/4p')
ax3_4.scatter(x_vals,y_vals3_4,z_vals3_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals3_4)):
    ax3_4.text(
        x_vals[i], 
        y_vals3_4[i], 
        z_vals3_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals3_4[i]:.2f}, {z_vals3_4[i]:.2f})",
        fontsize=8
    )

ax3_4.set_xlabel("X-Axis (Locked)")
ax3_4.set_ylabel("Y-Axis (mm)")
ax3_4.set_zlabel("Z-Axis (mm)")
ax3_4.set_title("Model 3 C45 4n/4p")
plt.show()
fig3_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 3/C45/Model_3_COR_4N4P.png', dpi = 300)

fcr3_5 = np.hstack(fcr3_5) 
x_vals3_5 = fcr3_5[0, :]
z_vals3_5 = fcr3_5[1, :]
print("X Coords: " , x_vals3_5)
print("Z Coords: " , z_vals3_5)

y_vals = np.linspace(0,0, len(x_vals3_5))
fig3_5 = plt.figure(5,figsize=(10,8))
ax3_5 = fig3_5.add_subplot(111,projection='3d')
fig3_5.canvas.manager.set_window_title('Model 1 C45 5n/5p')
ax3_5.scatter(y_vals,x_vals3_5,z_vals3_5, c = 'r', marker = 'o')

for i in range(len(x_vals3_5)):
    ax3_5.text(
        y_vals[i], 
        x_vals3_5[i], 
        z_vals3_5[i],
        f"{i}:({x_vals3_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals3_5[i]:.2f})",
        fontsize=8
    )

ax3_5.set_xlabel("Y-Axis (locked)")
ax3_5.set_ylabel("X-Axis (mm)")
ax3_5.set_zlabel("Z-Axis (mm)")
ax3_5.set_title("Model 3 C45 5n/5p")

plt.show()
fig3_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 3/C45/Model_3_COR_5N5P.png', dpi = 300)




data_4n1, data_4p1, data_5n1, data_5p1= read_file45_1("1")
fcr1_4, scale1_4, theta1_4 = calculate_FCOR_4n4p(data_4n1, data_4p1)
fcr1_5, scale1_5, theta1_5 = calculate_FCOR_5n5p(data_5n1, data_5p1)
print("Scale Values: ", scale1_4)
print("Angle vals (deg): ", np.rad2deg(theta1_4))

fcr1_4 = np.hstack(fcr1_4) 
y_vals1_4 = fcr1_4[0, :]
z_vals1_4 = fcr1_4[1, :]
print("Y Coords: " , y_vals1_4)
print("Z Coords: " , z_vals1_4)
x_vals = np.linspace(0,0, len(y_vals1_4))

fig1_4 = plt.figure(5,figsize=(10,8))
ax1_4 = fig1_4.add_subplot(111,projection='3d')
fig1_4.canvas.manager.set_window_title('Model 1 C45 4n/4p')
ax1_4.scatter(x_vals,y_vals1_4,z_vals1_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals1_4)):
    ax1_4.text(
        x_vals[i], 
        y_vals1_4[i], 
        z_vals1_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals1_4[i]:.2f}, {z_vals1_4[i]:.2f})",
        fontsize=8
    )

ax1_4.set_xlabel("X-Axis (Locked)")
ax1_4.set_ylabel("Y-Axis (mm)")
ax1_4.set_zlabel("Z-Axis (mm)")
ax1_4.set_title("Model 1 C45 4n/4p")
plt.show()
fig1_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 1/C45/Model_1_COR_4N4P.png', dpi = 300)

fcr1_5 = np.hstack(fcr1_5) 
x_vals1_5 = fcr1_5[0, :]
z_vals1_5 = fcr1_5[1, :]
print("X Coords: " , x_vals1_5)
print("Z Coords: " , z_vals1_5)

y_vals = np.linspace(0,0, len(x_vals1_5))
fig1_5 = plt.figure(5,figsize=(10,8))
ax1_5 = fig1_5.add_subplot(111,projection='3d')
fig1_5.canvas.manager.set_window_title('Model 1 C45 5n/5p')
ax1_5.scatter(y_vals,x_vals1_5,z_vals1_5, c = 'r', marker = 'o')

for i in range(len(x_vals1_5)):
    ax1_5.text(
        y_vals[i], 
        x_vals1_5[i], 
        z_vals1_5[i],
        f"{i}({x_vals1_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals1_5[i]:.2f})",
        fontsize=8
    )

ax1_5.set_xlabel("Y-Axis (locked)")
ax1_5.set_ylabel("X-Axis (mm)")
ax1_5.set_zlabel("Z-Axis (mm)")
ax1_5.set_title("Model 1 C45 5n/5p")

plt.show()
fig1_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 1/C45/Model_1_COR_5N5P.png', dpi = 300)


data_4n2, data_4p2, data_5n2, data_5p2= read_file45_3("2")
fcr2_4, scale2_4, theta2_4 = calculate_FCOR_4n4p(data_4n2, data_4p2)
fcr2_5, scale2_5, theta2_5 = calculate_FCOR_5n5p(data_5n2, data_5p2)
print("Scale Values: ", scale2_4)
print("Angle vals (deg): ", np.rad2deg(theta2_4))

fcr2_4 = np.hstack(fcr2_4) 
y_vals2_4 = fcr2_4[0, :]
z_vals2_4 = fcr2_4[1, :]
print("Y Coords: " , y_vals2_4)
print("Z Coords: " , z_vals2_4)
x_vals = np.linspace(0,0, len(y_vals2_4))

fig2_4 = plt.figure(5,figsize=(10,8))
ax2_4 = fig2_4.add_subplot(111,projection='3d')
fig2_4.canvas.manager.set_window_title('Model 2 C45 4n/4p')
ax2_4.scatter(x_vals,y_vals2_4,z_vals2_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals2_4)):
    ax2_4.text(
        x_vals[i], 
        y_vals2_4[i], 
        z_vals2_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals2_4[i]:.2f}, {z_vals2_4[i]:.2f})",
        fontsize=8
    )

ax2_4.set_xlabel("X-Axis (Locked)")
ax2_4.set_ylabel("Y-Axis (mm)")
ax2_4.set_zlabel("Z-Axis (mm)")
ax2_4.set_title("Model 2 C45 4n/4p")
plt.show()
fig2_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 2/C45/Model_2_COR_4N4P.png', dpi = 300)

fcr2_5 = np.hstack(fcr2_5) 
x_vals2_5 = fcr2_5[0, :]
z_vals2_5 = fcr2_5[1, :]
print("X Coords: " , x_vals2_5)
print("Z Coords: " , z_vals2_5)

y_vals = np.linspace(0,0, len(x_vals2_5))
fig2_5 = plt.figure(5,figsize=(10,8))
ax2_5 = fig2_5.add_subplot(111,projection='3d')
fig2_5.canvas.manager.set_window_title('Model 2 C45 5n/5p')
ax2_5.scatter(y_vals,x_vals2_5,z_vals2_5, c = 'r', marker = 'o')

for i in range(len(x_vals2_5)):
    ax2_5.text(
        y_vals[i], 
        x_vals2_5[i], 
        z_vals2_5[i],
        f"{i}({x_vals2_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals2_5[i]:.2f})",
        fontsize=8
    )

ax2_5.set_xlabel("Y-Axis (locked)")
ax2_5.set_ylabel("X-Axis (mm)")
ax2_5.set_zlabel("Z-Axis (mm)")
ax2_5.set_title("Model 2 C45 5n/5p")

plt.show()
fig2_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 2/C45/Model_2_COR_5N5P.png', dpi = 300)

data_4n6, data_4p6, data_5n6, data_5p6= read_file45_3("6")
fcr6_4, scale6_4, theta6_4 = calculate_FCOR_4n4p(data_4n6, data_4p6)
fcr6_5, scale6_5, theta6_5 = calculate_FCOR_5n5p(data_5n6, data_5p6)
print("Scale Values: ", scale6_4)
print("Angle vals (deg): ", np.rad2deg(theta6_4))

fcr6_4 = np.hstack(fcr6_4) 
y_vals6_4 = fcr6_4[0, :]
z_vals6_4 = fcr6_4[1, :]
print("Y Coords: " , y_vals6_4)
print("Z Coords: " , z_vals6_4)
x_vals = np.linspace(0,0, len(y_vals6_4))

fig6_4 = plt.figure(5,figsize=(10,8))
ax6_4 = fig6_4.add_subplot(111,projection='3d')
fig6_4.canvas.manager.set_window_title('Model 6 C45 4n/4p')
ax6_4.scatter(x_vals,y_vals6_4,z_vals6_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals6_4)):
    ax6_4.text(
        x_vals[i], 
        y_vals6_4[i], 
        z_vals6_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals6_4[i]:.2f}, {z_vals6_4[i]:.2f})",
        fontsize=8
    )

ax6_4.set_xlabel("X-Axis (Locked)")
ax6_4.set_ylabel("Y-Axis (mm)")
ax6_4.set_zlabel("Z-Axis (mm)")
ax6_4.set_title("Model 6 C45 4n/4p")
plt.show()
fig6_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 6/C45/Model_6_COR_4N4P.png', dpi = 300)

fcr6_5 = np.hstack(fcr6_5) 
x_vals6_5 = fcr6_5[0, :]
z_vals6_5 = fcr6_5[1, :]
print("X Coords: " , x_vals6_5)
print("Z Coords: " , z_vals6_5)

y_vals = np.linspace(0,0, len(x_vals6_5))
fig6_5 = plt.figure(5,figsize=(10,8))
ax6_5 = fig6_5.add_subplot(111,projection='3d')
fig6_5.canvas.manager.set_window_title('Model 6 C45 5n/5p')
ax6_5.scatter(y_vals,x_vals6_5,z_vals6_5, c = 'r', marker = 'o')

for i in range(len(x_vals6_5)):
    ax6_5.text(
        y_vals[i], 
        x_vals6_5[i], 
        z_vals6_5[i],
        f"{i}({x_vals6_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals6_5[i]:.2f})",
        fontsize=8
    )

ax6_5.set_xlabel("Y-Axis (locked)")
ax6_5.set_ylabel("X-Axis (mm)")
ax6_5.set_zlabel("Z-Axis (mm)")
ax6_5.set_title("Model 6 C45 5n/5p")

plt.show()
fig6_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 6/C45/Model_6_COR_5N5P.png', dpi = 300)


data_4n8, data_4p8, data_5n8, data_5p8= read_file45_3("8")
fcr8_4, scale8_4, theta8_4 = calculate_FCOR_4n4p(data_4n8, data_4p8)
fcr8_5, scale8_5, theta8_5 = calculate_FCOR_5n5p(data_5n8, data_5p8)
print("Scale Values: ", scale8_4)
print("Angle vals (deg): ", np.rad2deg(theta8_4))

fcr8_4 = np.hstack(fcr8_4) 
y_vals8_4 = fcr8_4[0, :]
z_vals8_4 = fcr8_4[1, :]
print("Y Coords: " , y_vals8_4)
print("Z Coords: " , z_vals8_4)
x_vals = np.linspace(0,0, len(y_vals8_4))

fig8_4 = plt.figure(5,figsize=(10,8))
ax8_4 = fig8_4.add_subplot(111,projection='3d')
fig8_4.canvas.manager.set_window_title('Model 8 C45 4n/4p')
ax8_4.scatter(x_vals,y_vals8_4,z_vals8_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals8_4)):
    ax8_4.text(
        x_vals[i], 
        y_vals8_4[i], 
        z_vals8_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals8_4[i]:.2f}, {z_vals8_4[i]:.2f})",
        fontsize=8
    )

ax8_4.set_xlabel("X-Axis (Locked)")
ax8_4.set_ylabel("Y-Axis (mm)")
ax8_4.set_zlabel("Z-Axis (mm)")
ax8_4.set_title("Model 8 C45 4n/4p")
plt.show()
fig8_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 8/C45/Model_8_COR_4N4P.png', dpi = 300)

fcr8_5 = np.hstack(fcr8_5) 
x_vals8_5 = fcr8_5[0, :]
z_vals8_5 = fcr8_5[1, :]
print("X Coords: " , x_vals8_5)
print("Z Coords: " , z_vals8_5)

y_vals = np.linspace(0,0, len(x_vals8_5))
fig8_5 = plt.figure(5,figsize=(10,8))
ax8_5 = fig8_5.add_subplot(111,projection='3d')
fig8_5.canvas.manager.set_window_title('Model 8 C45 5n/5p')
ax8_5.scatter(y_vals,x_vals8_5,z_vals8_5, c = 'r', marker = 'o')

for i in range(len(x_vals8_5)):
    ax8_5.text(
        y_vals[i], 
        x_vals8_5[i], 
        z_vals8_5[i],
        f"{i}({x_vals8_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals8_5[i]:.2f})",
        fontsize=8
    )

ax8_5.set_xlabel("Y-Axis (locked)")
ax8_5.set_ylabel("X-Axis (mm)")
ax8_5.set_zlabel("Z-Axis (mm)")
ax8_5.set_title("Model 8 C45 5n/5p")

plt.show()
fig8_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 8/C45/Model_8_COR_5N5P.png', dpi = 300)

data_4n9, data_4p9, data_5n9, data_5p9= read_file45_3("9")
fcr9_4, scale9_4, theta9_4 = calculate_FCOR_4n4p(data_4n9, data_4p9)
fcr9_5, scale9_5, theta9_5 = calculate_FCOR_5n5p(data_5n9, data_5p9)
print("Scale Values: ", scale9_4)
print("Angle vals (deg): ", np.rad2deg(theta9_4))

fcr9_4 = np.hstack(fcr9_4) 
y_vals9_4 = fcr9_4[0, :]
z_vals9_4 = fcr9_4[1, :]
print("Y Coords: " , y_vals9_4)
print("Z Coords: " , z_vals9_4)
x_vals = np.linspace(0,0, len(y_vals9_4))

fig9_4 = plt.figure(5,figsize=(10,8))
ax9_4 = fig9_4.add_subplot(111,projection='3d')
fig9_4.canvas.manager.set_window_title('Model 9 C45 4n/4p')
ax9_4.scatter(x_vals,y_vals9_4,z_vals9_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals9_4)):
    ax9_4.text(
        x_vals[i], 
        y_vals9_4[i], 
        z_vals9_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals9_4[i]:.2f}, {z_vals9_4[i]:.2f})",
        fontsize=8
    )

ax9_4.set_xlabel("X-Axis (Locked)")
ax9_4.set_ylabel("Y-Axis (mm)")
ax9_4.set_zlabel("Z-Axis (mm)")
ax9_4.set_title("Model 9 C45 4n/4p")
plt.show()
fig9_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 9/C45/Model_9_COR_4N4P.png', dpi = 300)

fcr9_5 = np.hstack(fcr9_5) 
x_vals9_5 = fcr9_5[0, :]
z_vals9_5 = fcr9_5[1, :]
print("X Coords: " , x_vals9_5)
print("Z Coords: " , z_vals9_5)

y_vals = np.linspace(0,0, len(x_vals9_5))
fig9_5 = plt.figure(5,figsize=(10,8))
ax9_5 = fig9_5.add_subplot(111,projection='3d')
fig9_5.canvas.manager.set_window_title('Model 9 C45 5n/5p')
ax9_5.scatter(y_vals,x_vals9_5,z_vals9_5, c = 'r', marker = 'o')

for i in range(len(x_vals9_5)):
    ax9_5.text(
        y_vals[i], 
        x_vals9_5[i], 
        z_vals9_5[i],
        f"{i}({x_vals9_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals9_5[i]:.2f})",
        fontsize=8
    )

ax9_5.set_xlabel("Y-Axis (locked)")
ax9_5.set_ylabel("X-Axis (mm)")
ax9_5.set_zlabel("Z-Axis (mm)")
ax9_5.set_title("Model 9 C45 5n/5p")

plt.show()
fig9_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 9/C45/Model_9_COR_5N5P.png', dpi = 300)


data_4n10, data_4p10, data_5n10, data_5p10= read_file45_3("10")
fcr10_4, scale10_4, theta10_4 = calculate_FCOR_4n4p(data_4n10, data_4p10)
fcr10_5, scale10_5, theta10_5 = calculate_FCOR_5n5p(data_5n10, data_5p10)
print("Scale Values: ", scale10_4)
print("Angle vals (deg): ", np.rad2deg(theta10_4))

fcr10_4 = np.hstack(fcr10_4) 
y_vals10_4 = fcr10_4[0, :]
z_vals10_4 = fcr10_4[1, :]
print("Y Coords: " , y_vals10_4)
print("Z Coords: " , z_vals10_4)
x_vals = np.linspace(0,0, len(y_vals10_4))

fig10_4 = plt.figure(5,figsize=(10,8))
ax10_4 = fig10_4.add_subplot(111,projection='3d')
fig10_4.canvas.manager.set_window_title('Model 10 C45 4n/4p')
ax10_4.scatter(x_vals,y_vals10_4,z_vals10_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals10_4)):
    ax10_4.text(
        x_vals[i], 
        y_vals10_4[i], 
        z_vals10_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals10_4[i]:.2f}, {z_vals10_4[i]:.2f})",
        fontsize=8
    )

ax10_4.set_xlabel("X-Axis (Locked)")
ax10_4.set_ylabel("Y-Axis (mm)")
ax10_4.set_zlabel("Z-Axis (mm)")
ax10_4.set_title("Model 10 C45 4n/4p")
plt.show()
fig10_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 10/C45/Model_10_COR_4N4P.png', dpi = 300)

fcr10_5 = np.hstack(fcr10_5) 
x_vals10_5 = fcr10_5[0, :]
z_vals10_5 = fcr10_5[1, :]
print("X Coords: " , x_vals10_5)
print("Z Coords: " , z_vals10_5)

y_vals = np.linspace(0,0, len(x_vals10_5))
fig10_5 = plt.figure(5,figsize=(10,8))
ax10_5 = fig10_5.add_subplot(111,projection='3d')
fig10_5.canvas.manager.set_window_title('Model 10 C45 5n/5p')
ax10_5.scatter(y_vals,x_vals10_5,z_vals10_5, c = 'r', marker = 'o')

for i in range(len(x_vals10_5)):
    ax10_5.text(
        y_vals[i], 
        x_vals10_5[i], 
        z_vals10_5[i],
        f"{i}({x_vals10_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals8_5[i]:.2f})",
        fontsize=8
    )

ax10_5.set_xlabel("Y-Axis (locked)")
ax10_5.set_ylabel("X-Axis (mm)")
ax10_5.set_zlabel("Z-Axis (mm)")
ax10_5.set_title("Model 10 C45 5n/5p")

plt.show()
fig10_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 10/C45/Model_10_COR_5N5P.png', dpi = 300)

data_4n11, data_4p11, data_5n11, data_5p11= read_file45_3("11")
fcr11_4, scale11_4, theta11_4 = calculate_FCOR_4n4p(data_4n11, data_4p11)
fcr11_5, scale11_5, theta11_5 = calculate_FCOR_5n5p(data_5n11, data_5p11)
print("Scale Values: ", scale11_4)
print("Angle vals (deg): ", np.rad2deg(theta11_4))

fcr11_4 = np.hstack(fcr11_4) 
y_vals11_4 = fcr11_4[0, :]
z_vals11_4 = fcr11_4[1, :]
print("Y Coords: " , y_vals11_4)
print("Z Coords: " , z_vals11_4)
x_vals = np.linspace(0,0, len(y_vals11_4))

fig11_4 = plt.figure(5,figsize=(10,8))
ax11_4 = fig11_4.add_subplot(111,projection='3d')
fig11_4.canvas.manager.set_window_title('Model 11 C45 4n/4p')
ax11_4.scatter(x_vals,y_vals11_4,z_vals11_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals11_4)):
    ax11_4.text(
        x_vals[i], 
        y_vals11_4[i], 
        z_vals11_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals11_4[i]:.2f}, {z_vals11_4[i]:.2f})",
        fontsize=8
    )

ax11_4.set_xlabel("X-Axis (Locked)")
ax11_4.set_ylabel("Y-Axis (mm)")
ax11_4.set_zlabel("Z-Axis (mm)")
ax11_4.set_title("Model 11 C45 4n/4p")
plt.show()
fig11_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 11/C45/Model_11_COR_4N4P.png', dpi = 300)

fcr11_5 = np.hstack(fcr11_5) 
x_vals11_5 = fcr11_5[0, :]
z_vals11_5 = fcr11_5[1, :]
print("X Coords: " , x_vals11_5)
print("Z Coords: " , z_vals11_5)

y_vals = np.linspace(0,0, len(x_vals11_5))
fig11_5 = plt.figure(5,figsize=(10,8))
ax11_5 = fig11_5.add_subplot(111,projection='3d')
fig11_5.canvas.manager.set_window_title('Model 11 C45 5n/5p')
ax11_5.scatter(y_vals,x_vals11_5,z_vals11_5, c = 'r', marker = 'o')

for i in range(len(x_vals11_5)):
    ax11_5.text(
        y_vals[i], 
        x_vals11_5[i], 
        z_vals11_5[i],
        f"{i}({x_vals11_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals11_5[i]:.2f})",
        fontsize=8
    )

ax11_5.set_xlabel("Y-Axis (locked)")
ax11_5.set_ylabel("X-Axis (mm)")
ax11_5.set_zlabel("Z-Axis (mm)")
ax11_5.set_title("Model 11 C45 5n/5p")

plt.show()
fig11_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 11/C45/Model_11_COR_5N5P.png', dpi = 300)


data_4n12, data_4p12, data_5n12, data_5p12= read_file45_3("12")
fcr12_4, scale12_4, theta12_4 = calculate_FCOR_4n4p(data_4n12, data_4p12)
fcr12_5, scale12_5, theta12_5 = calculate_FCOR_5n5p(data_5n12, data_5p12)
print("Scale Values: ", scale12_4)
print("Angle vals (deg): ", np.rad2deg(theta12_4))

fcr12_4 = np.hstack(fcr12_4) 
y_vals12_4 = fcr12_4[0, :]
z_vals12_4 = fcr12_4[1, :]
print("Y Coords: " , y_vals12_4)
print("Z Coords: " , z_vals12_4)
x_vals = np.linspace(0,0, len(y_vals12_4))

fig12_4 = plt.figure(5,figsize=(10,8))
ax12_4 = fig12_4.add_subplot(111,projection='3d')
fig12_4.canvas.manager.set_window_title('Model 12 C45 4n/4p')
ax12_4.scatter(x_vals,y_vals12_4,z_vals12_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals12_4)):
    ax12_4.text(
        x_vals[i], 
        y_vals12_4[i], 
        z_vals12_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals12_4[i]:.2f}, {z_vals12_4[i]:.2f})",
        fontsize=8
    )

ax12_4.set_xlabel("X-Axis (Locked)")
ax12_4.set_ylabel("Y-Axis (mm)")
ax12_4.set_zlabel("Z-Axis (mm)")
ax12_4.set_title("Model 12 C45 4n/4p")
plt.show()
fig12_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 12/C45/Model_12_COR_4N4P.png', dpi = 300)

fcr12_5 = np.hstack(fcr12_5) 
x_vals12_5 = fcr12_5[0, :]
z_vals12_5 = fcr12_5[1, :]
print("X Coords: " , x_vals12_5)
print("Z Coords: " , z_vals12_5)

y_vals = np.linspace(0,0, len(x_vals12_5))
fig12_5 = plt.figure(5,figsize=(10,8))
ax12_5 = fig12_5.add_subplot(111,projection='3d')
fig12_5.canvas.manager.set_window_title('Model 12 C45 5n/5p')
ax12_5.scatter(y_vals,x_vals12_5,z_vals12_5, c = 'r', marker = 'o')

for i in range(len(x_vals12_5)):
    ax12_5.text(
        y_vals[i], 
        x_vals12_5[i], 
        z_vals12_5[i],
        f"{i}({x_vals12_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals12_5[i]:.2f})",
        fontsize=8
    )

ax12_5.set_xlabel("Y-Axis (locked)")
ax12_5.set_ylabel("X-Axis (mm)")
ax12_5.set_zlabel("Z-Axis (mm)")
ax12_5.set_title("Model 12 C45 5n/5p")

plt.show()
fig12_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 12/C45/Model_12_COR_5N5P.png', dpi = 300)

data_4n13, data_4p13, data_5n13, data_5p13= read_file45_3("13")
fcr13_4, scale13_4, theta13_4 = calculate_FCOR_4n4p(data_4n13, data_4p13)
fcr13_5, scale13_5, theta13_5 = calculate_FCOR_5n5p(data_5n13, data_5p13)
print("Scale Values: ", scale13_4)
print("Angle vals (deg): ", np.rad2deg(theta13_4))

fcr13_4 = np.hstack(fcr13_4) 
y_vals13_4 = fcr13_4[0, :]
z_vals13_4 = fcr13_4[1, :]
print("Y Coords: " , y_vals13_4)
print("Z Coords: " , z_vals13_4)
x_vals = np.linspace(0,0, len(y_vals13_4))

fig13_4 = plt.figure(5,figsize=(10,8))
ax13_4 = fig13_4.add_subplot(111,projection='3d')
fig13_4.canvas.manager.set_window_title('Model 13 C45 4n/4p')
ax13_4.scatter(x_vals,y_vals13_4,z_vals13_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals13_4)):
    ax13_4.text(
        x_vals[i], 
        y_vals13_4[i], 
        z_vals13_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals13_4[i]:.2f}, {z_vals13_4[i]:.2f})",
        fontsize=8
    )

ax13_4.set_xlabel("X-Axis (Locked)")
ax13_4.set_ylabel("Y-Axis (mm)")
ax13_4.set_zlabel("Z-Axis (mm)")
ax13_4.set_title("Model 13 C45 4n/4p")
plt.show()
fig13_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 13/C45/Model_13_COR_4N4P.png', dpi = 300)

fcr13_5 = np.hstack(fcr13_5) 
x_vals13_5 = fcr13_5[0, :]
z_vals13_5 = fcr13_5[1, :]
print("X Coords: " , x_vals13_5)
print("Z Coords: " , z_vals13_5)

y_vals = np.linspace(0,0, len(x_vals13_5))
fig13_5 = plt.figure(5,figsize=(10,8))
ax13_5 = fig13_5.add_subplot(111,projection='3d')
fig13_5.canvas.manager.set_window_title('Model 13 C45 5n/5p')
ax13_5.scatter(y_vals,x_vals13_5,z_vals13_5, c = 'r', marker = 'o')

for i in range(len(x_vals13_5)):
    ax13_5.text(
        y_vals[i], 
        x_vals13_5[i], 
        z_vals13_5[i],
        f"{i}({x_vals13_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals13_5[i]:.2f})",
        fontsize=8
    )

ax13_5.set_xlabel("Y-Axis (locked)")
ax13_5.set_ylabel("X-Axis (mm)")
ax13_5.set_zlabel("Z-Axis (mm)")
ax13_5.set_title("Model 13 C45 5n/5p")

plt.show()
fig13_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 13/C45/Model_13_COR_5N5P.png', dpi = 300)

"""

# ------ C3-4 COR Values -------

data_4n15, data_4p15, data_5n15, data_5p15= read_file34_15("15")
fcr15_4, scale15_4, theta15_4 = calculate_FCOR_4n4p_C34(data_4n15, data_4p15)
fcr15_5, scale15_5, theta15_5 = calculate_FCOR_5n5p_C34(data_5n15, data_5p15)
print("Scale Values: ", scale15_4)
print("Angle vals (deg): ", np.rad2deg(theta15_4))

fcr15_4 = np.hstack(fcr15_4) 
y_vals15_4 = fcr15_4[0, :]
z_vals15_4 = fcr15_4[1, :]
print("Y Coords: " , y_vals15_4)
print("Z Coords: " , z_vals15_4)
x_vals = np.linspace(0,0, len(y_vals15_4))

fig15_4 = plt.figure(5,figsize=(10,8))
ax15_4 = fig15_4.add_subplot(111,projection='3d')
fig15_4.canvas.manager.set_window_title('Model 1 C45 4n/4p')
ax15_4.scatter(x_vals,y_vals15_4,z_vals15_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals15_4)):
    ax15_4.text(
        x_vals[i], 
        y_vals15_4[i], 
        z_vals15_4[i],
        f"{i}: ({x_vals[i]:.2f}, {y_vals15_4[i]:.2f}, {z_vals15_4[i]:.2f})",
        fontsize=8
    )

ax15_4.set_xlabel("X-Axis (Locked)")
ax15_4.set_ylabel("Y-Axis (mm)")
ax15_4.set_zlabel("Z-Axis (mm)")
ax15_4.set_title("Model 15 C34 4n/4p")
plt.show()
fig15_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 15/C34/Model_15_COR_4N4P_C34.png', dpi = 300)

fcr15_5 = np.hstack(fcr15_5) 
x_vals15_5 = fcr15_5[0, :]
z_vals15_5 = fcr15_5[1, :]
print("X Coords: " , x_vals15_5)
print("Z Coords: " , z_vals15_5)

y_vals = np.linspace(0,0, len(x_vals15_5))
fig15_5 = plt.figure(5,figsize=(10,8))
ax15_5 = fig15_5.add_subplot(111,projection='3d')
fig15_5.canvas.manager.set_window_title('Model 15 C45 5n/5p')
ax15_5.scatter(y_vals,x_vals15_5,z_vals15_5, c = 'r', marker = 'o')

for i in range(len(x_vals15_5)):
    ax15_5.text(
        y_vals[i], 
        x_vals15_5[i], 
        z_vals15_5[i],
        f"{i}: ({x_vals15_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals15_5[i]:.2f})",
        fontsize=8
    )

ax15_5.set_xlabel("Y-Axis (locked)")
ax15_5.set_ylabel("X-Axis (mm)")
ax15_5.set_zlabel("Z-Axis (mm)")
ax15_5.set_title("Model 15 C34 5n/5p")

plt.show()
fig15_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 15/C34/Model_15_COR_5N5P_C34.png', dpi = 300)


data_4n1, data_4p1, data_5n1, data_5p1= read_file34_1("1")
fcr1_4, scale1_4, theta1_4 = calculate_FCOR_4n4p_C34(data_4n1, data_4p1)
fcr1_5, scale1_5, theta1_5 = calculate_FCOR_5n5p_C34(data_5n1, data_5p1)
print("Scale Values: ", scale1_4)
print("Angle vals (deg): ", np.rad2deg(theta1_4))

fcr1_4 = np.hstack(fcr1_4) 
y_vals1_4 = fcr1_4[0, :]
z_vals1_4 = fcr1_4[1, :]
print("Y Coords: " , y_vals1_4)
print("Z Coords: " , z_vals1_4)
x_vals = np.linspace(0,0, len(y_vals1_4))

fig1_4 = plt.figure(5,figsize=(10,8))
ax1_4 = fig1_4.add_subplot(111,projection='3d')
fig1_4.canvas.manager.set_window_title('Model 1 C45 4n/4p')
ax1_4.scatter(x_vals,y_vals1_4,z_vals1_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals1_4)):
    ax1_4.text(
        x_vals[i], 
        y_vals1_4[i], 
        z_vals1_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals1_4[i]:.2f}, {z_vals1_4[i]:.2f})",
        fontsize=8
    )

ax1_4.set_xlabel("X-Axis (Locked)")
ax1_4.set_ylabel("Y-Axis (mm)")
ax1_4.set_zlabel("Z-Axis (mm)")
ax1_4.set_title("Model 1 C34 4n/4p")
plt.show()
fig1_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 1/C34/Model_1_COR_4N4P_C34.png', dpi = 300)

fcr1_5 = np.hstack(fcr1_5) 
x_vals1_5 = fcr1_5[0, :]
z_vals1_5 = fcr1_5[1, :]
print("X Coords: " , x_vals1_5)
print("Z Coords: " , z_vals1_5)

y_vals = np.linspace(0,0, len(x_vals1_5))
fig1_5 = plt.figure(5,figsize=(10,8))
ax1_5 = fig1_5.add_subplot(111,projection='3d')
fig1_5.canvas.manager.set_window_title('Model 1 C45 5n/5p')
ax1_5.scatter(y_vals,x_vals1_5,z_vals1_5, c = 'r', marker = 'o')

for i in range(len(x_vals1_5)):
    ax1_5.text(
        y_vals[i], 
        x_vals1_5[i], 
        z_vals1_5[i],
        f"{i}({x_vals1_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals1_5[i]:.2f})",
        fontsize=8
    )

ax1_5.set_xlabel("Y-Axis (locked)")
ax1_5.set_ylabel("X-Axis (mm)")
ax1_5.set_zlabel("Z-Axis (mm)")
ax1_5.set_title("Model 1 C34 5n/5p")

plt.show()
fig1_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 1/C34/Model_1_COR_5N5P_C34.png', dpi = 300)


data_4n3, data_4p3, data_5n3, data_5p3= read_file34_15("3")
fcr3_4, scale3_4, theta3_4 = calculate_FCOR_4n4p_C34(data_4n3, data_4p3)
fcr3_5, scale3_5, theta3_5 = calculate_FCOR_5n5p_C34(data_5n3, data_5p3)
print("Scale Values: ", scale3_4)
print("Angle vals (deg): ", np.rad2deg(theta3_4))

fcr3_4 = np.hstack(fcr3_4) 
y_vals3_4 = fcr3_4[0, :]
z_vals3_4 = fcr3_4[1, :]
print("Y Coords: " , y_vals3_4)
print("Z Coords: " , z_vals3_4)
x_vals = np.linspace(0,0, len(y_vals3_4))

fig3_4 = plt.figure(5,figsize=(10,8))
ax3_4 = fig3_4.add_subplot(111,projection='3d')
fig3_4.canvas.manager.set_window_title('Model 3 C45 4n/4p')
ax3_4.scatter(x_vals,y_vals3_4,z_vals3_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals3_4)):
    ax3_4.text(
        x_vals[i], 
        y_vals3_4[i], 
        z_vals3_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals3_4[i]:.2f}, {z_vals3_4[i]:.2f})",
        fontsize=8
    )

ax3_4.set_xlabel("X-Axis (Locked)")
ax3_4.set_ylabel("Y-Axis (mm)")
ax3_4.set_zlabel("Z-Axis (mm)")
ax3_4.set_title("Model 3 C34 4n/4p")
plt.show()
fig3_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 3/C34/Model_3_COR_4N4P_C34.png', dpi = 300)

fcr3_5 = np.hstack(fcr3_5) 
x_vals3_5 = fcr3_5[0, :]
z_vals3_5 = fcr3_5[1, :]
print("X Coords: " , x_vals3_5)
print("Z Coords: " , z_vals3_5)

y_vals = np.linspace(0,0, len(x_vals3_5))
fig3_5 = plt.figure(5,figsize=(10,8))
ax3_5 = fig3_5.add_subplot(111,projection='3d')
fig3_5.canvas.manager.set_window_title('Model 3 C34 5n/5p')
ax3_5.scatter(y_vals,x_vals3_5,z_vals3_5, c = 'r', marker = 'o')

for i in range(len(x_vals3_5)):
    ax3_5.text(
        y_vals[i], 
        x_vals3_5[i], 
        z_vals3_5[i],
        f"{i}({x_vals3_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals3_5[i]:.2f})",
        fontsize=8
    )

ax3_5.set_xlabel("Y-Axis (locked)")
ax3_5.set_ylabel("X-Axis (mm)")
ax3_5.set_zlabel("Z-Axis (mm)")
ax3_5.set_title("Model 3 C34 5n/5p")

plt.show()
fig3_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 3/C34/Model_3_COR_5N5P_C34.png', dpi = 300)


data_4n4, data_4p4, data_5n4, data_5p4= read_file34_4("4")
fcr4_4, scale4_4, theta4_4 = calculate_FCOR_4n4p_C34(data_4n4, data_4p4)
fcr4_5, scale4_5, theta4_5 = calculate_FCOR_5n5p_C34(data_5n4, data_5p4)
print("Scale Values: ", scale4_4)
print("Angle vals (deg): ", np.rad2deg(theta4_4))

fcr4_4 = np.hstack(fcr4_4) 
y_vals4_4 = fcr4_4[0, :]
z_vals4_4 = fcr4_4[1, :]
print("Y Coords: " , y_vals4_4)
print("Z Coords: " , z_vals4_4)
x_vals = np.linspace(0,0, len(y_vals4_4))

fig4_4 = plt.figure(5,figsize=(10,8))
ax4_4 = fig4_4.add_subplot(111,projection='3d')
fig4_4.canvas.manager.set_window_title('Model 4 C45 4n/4p')
ax4_4.scatter(x_vals,y_vals4_4,z_vals4_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals4_4)):
    ax4_4.text(
        x_vals[i], 
        y_vals4_4[i], 
        z_vals4_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals4_4[i]:.2f}, {z_vals4_4[i]:.2f})",
        fontsize=8
    )

ax4_4.set_xlabel("X-Axis (Locked)")
ax4_4.set_ylabel("Y-Axis (mm)")
ax4_4.set_zlabel("Z-Axis (mm)")
ax4_4.set_title("Model 4 C34 4n/4p")
plt.show()
fig4_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 4/C34/Model_4_COR_4N4P_C34.png', dpi = 300)

fcr4_5 = np.hstack(fcr4_5) 
x_vals4_5 = fcr4_5[0, :]
z_vals4_5 = fcr4_5[1, :]
print("X Coords: " , x_vals4_5)
print("Z Coords: " , z_vals4_5)

y_vals = np.linspace(0,0, len(x_vals4_5))
fig4_5 = plt.figure(5,figsize=(10,8))
ax4_5 = fig4_5.add_subplot(111,projection='3d')
fig4_5.canvas.manager.set_window_title('Model 4 C34 5n/5p')
ax4_5.scatter(y_vals,x_vals4_5,z_vals4_5, c = 'r', marker = 'o')

for i in range(len(x_vals4_5)):
    ax4_5.text(
        y_vals[i], 
        x_vals4_5[i], 
        z_vals4_5[i],
        f"{i}({x_vals4_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals4_5[i]:.2f})",
        fontsize=8
    )

ax4_5.set_xlabel("Y-Axis (locked)")
ax4_5.set_ylabel("X-Axis (mm)")
ax4_5.set_zlabel("Z-Axis (mm)")
ax4_5.set_title("Model 4 C34 5n/5p")

plt.show()
fig4_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 4/C34/Model_4_COR_5N5P_C34.png', dpi = 300)


data_4n5, data_4p5, data_5n5, data_5p5= read_file34_15("5")
fcr5_4, scale5_4, theta5_4 = calculate_FCOR_4n4p_C34(data_4n5, data_4p5)
fcr5_5, scale5_5, theta5_5 = calculate_FCOR_5n5p_C34(data_5n5, data_5p5)
print("Scale Values: ", scale5_4)
print("Angle vals (deg): ", np.rad2deg(theta5_4))

fcr5_4 = np.hstack(fcr5_4) 
y_vals5_4 = fcr5_4[0, :]
z_vals5_4 = fcr5_4[1, :]
print("Y Coords: " , y_vals5_4)
print("Z Coords: " , z_vals5_4)
x_vals = np.linspace(0,0, len(y_vals5_4))

fig5_4 = plt.figure(5,figsize=(10,8))
ax5_4 = fig5_4.add_subplot(111,projection='3d')
fig5_4.canvas.manager.set_window_title('Model 4 C45 4n/4p')
ax5_4.scatter(x_vals,y_vals5_4,z_vals5_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals5_4)):
    ax5_4.text(
        x_vals[i], 
        y_vals5_4[i], 
        z_vals5_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals5_4[i]:.2f}, {z_vals5_4[i]:.2f})",
        fontsize=8
    )

ax5_4.set_xlabel("X-Axis (Locked)")
ax5_4.set_ylabel("Y-Axis (mm)")
ax5_4.set_zlabel("Z-Axis (mm)")
ax5_4.set_title("Model 5 C34 4n/4p")
plt.show()
fig5_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 5/C34/Model_5_COR_4N4P_C34.png', dpi = 300)

fcr5_5 = np.hstack(fcr5_5) 
x_vals5_5 = fcr5_5[0, :]
z_vals5_5 = fcr5_5[1, :]
print("X Coords: " , x_vals5_5)
print("Z Coords: " , z_vals5_5)

y_vals = np.linspace(0,0, len(x_vals5_5))
fig5_5 = plt.figure(5,figsize=(10,8))
ax5_5 = fig5_5.add_subplot(111,projection='3d')
fig5_5.canvas.manager.set_window_title('Model 4 C34 5n/5p')
ax5_5.scatter(y_vals,x_vals5_5,z_vals5_5, c = 'r', marker = 'o')

for i in range(len(x_vals5_5)):
    ax5_5.text(
        y_vals[i], 
        x_vals5_5[i], 
        z_vals5_5[i],
        f"{i}({x_vals5_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals5_5[i]:.2f})",
        fontsize=8
    )

ax5_5.set_xlabel("Y-Axis (locked)")
ax5_5.set_ylabel("X-Axis (mm)")
ax5_5.set_zlabel("Z-Axis (mm)")
ax5_5.set_title("Model 5 C34 5n/5p")

plt.show()
fig5_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 5/C34/Model_5_COR_5N5P_C34.png', dpi = 300)



data_4n14, data_4p14, data_5n14, data_5p14= read_file34_15("14")
fcr14_4, scale14_4, theta14_4 = calculate_FCOR_4n4p_C34(data_4n14, data_4p14)
fcr14_5, scale14_5, theta14_5 = calculate_FCOR_5n5p_C34(data_5n14, data_5p14)
print("Scale Values: ", scale14_4)
print("Angle vals (deg): ", np.rad2deg(theta14_4))

fcr14_4 = np.hstack(fcr14_4) 
y_vals14_4 = fcr14_4[0, :]
z_vals14_4 = fcr14_4[1, :]
print("Y Coords: " , y_vals14_4)
print("Z Coords: " , z_vals14_4)
x_vals = np.linspace(0,0, len(y_vals14_4))

fig14_4 = plt.figure(5,figsize=(10,8))
ax14_4 = fig14_4.add_subplot(111,projection='3d')
fig14_4.canvas.manager.set_window_title('Model 14 C45 4n/4p')
ax14_4.scatter(x_vals,y_vals14_4,z_vals14_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals14_4)):
    ax14_4.text(
        x_vals[i], 
        y_vals14_4[i], 
        z_vals14_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals14_4[i]:.2f}, {z_vals14_4[i]:.2f})",
        fontsize=8
    )

ax14_4.set_xlabel("X-Axis (Locked)")
ax14_4.set_ylabel("Y-Axis (mm)")
ax14_4.set_zlabel("Z-Axis (mm)")
ax14_4.set_title("Model 14 C34 4n/4p")
plt.show()
fig14_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 14/C34/Model_14_COR_4N4P_C34.png', dpi = 300)

fcr14_5 = np.hstack(fcr14_5) 
x_vals14_5 = fcr14_5[0, :]
z_vals14_5 = fcr14_5[1, :]
print("X Coords: " , x_vals14_5)
print("Z Coords: " , z_vals14_5)

y_vals = np.linspace(0,0, len(x_vals14_5))
fig14_5 = plt.figure(5,figsize=(10,8))
ax14_5 = fig14_5.add_subplot(111,projection='3d')
fig14_5.canvas.manager.set_window_title('Model 14 C34 5n/5p')
ax14_5.scatter(y_vals,x_vals14_5,z_vals14_5, c = 'r', marker = 'o')

for i in range(len(x_vals14_5)):
    ax14_5.text(
        y_vals[i], 
        x_vals14_5[i], 
        z_vals14_5[i],
        f"{i}({x_vals14_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals14_5[i]:.2f})",
        fontsize=8
    )

ax14_5.set_xlabel("Y-Axis (locked)")
ax14_5.set_ylabel("X-Axis (mm)")
ax14_5.set_zlabel("Z-Axis (mm)")
ax14_5.set_title("Model 14 C34 5n/5p")

plt.show()
fig14_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 14/C34/Model_14_COR_5N5P_C34.png', dpi = 300)


# --- C56 Plots -------


data_4n15, data_4p15, data_5n15, data_5p15= read_file56_15("15")
fcr15_4, scale15_4, theta15_4 = calculate_FCOR_4n4p_C56(data_4n15, data_4p15)
fcr15_5, scale15_5, theta15_5 = calculate_FCOR_5n5p_C56(data_5n15, data_5p15)
print("Scale Values: ", scale15_4)
print("Angle vals (deg): ", np.rad2deg(theta15_4))

fcr15_4 = np.hstack(fcr15_4) 
y_vals15_4 = fcr15_4[0, :]
z_vals15_4 = fcr15_4[1, :]
print("Y Coords: " , y_vals15_4)
print("Z Coords: " , z_vals15_4)
x_vals = np.linspace(0,0, len(y_vals15_4))

fig15_4 = plt.figure(5,figsize=(10,8))
ax15_4 = fig15_4.add_subplot(111,projection='3d')
fig15_4.canvas.manager.set_window_title('Model 15 C56 4n/4p')
ax15_4.scatter(x_vals,y_vals15_4,z_vals15_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals15_4)):
    ax15_4.text(
        x_vals[i], 
        y_vals15_4[i], 
        z_vals15_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals15_4[i]:.2f}, {z_vals15_4[i]:.2f})",
        fontsize=8
    )

ax15_4.set_xlabel("X-Axis (Locked)")
ax15_4.set_ylabel("Y-Axis (mm)")
ax15_4.set_zlabel("Z-Axis (mm)")
ax15_4.set_title("Model 15 C56 4n/4p")
plt.show()
fig15_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 15/C56/Model_15_COR_4N4P_C56.png', dpi = 300)

fcr15_5 = np.hstack(fcr15_5) 
x_vals15_5 = fcr15_5[0, :]
z_vals15_5 = fcr15_5[1, :]
print("X Coords: " , x_vals15_5)
print("Z Coords: " , z_vals15_5)

y_vals = np.linspace(0,0, len(x_vals15_5))
fig15_5 = plt.figure(5,figsize=(10,8))
ax15_5 = fig15_5.add_subplot(111,projection='3d')
fig15_5.canvas.manager.set_window_title('Model 15 C45 5n/5p')
ax15_5.scatter(y_vals,x_vals15_5,z_vals15_5, c = 'r', marker = 'o')

for i in range(len(x_vals15_5)):
    ax15_5.text(
        y_vals[i], 
        x_vals15_5[i], 
        z_vals15_5[i],
        f"{i}({x_vals15_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals15_5[i]:.2f})",
        fontsize=8
    )

ax15_5.set_xlabel("Y-Axis (locked)")
ax15_5.set_ylabel("X-Axis (mm)")
ax15_5.set_zlabel("Z-Axis (mm)")
ax15_5.set_title("Model 15 C56 5n/5p")

plt.show()
fig15_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 15/C56/Model_15_COR_5N5P_C56.png', dpi = 300)



data_4n1, data_4p1, data_5n1, data_5p1= read_file56_15("1")
fcr1_4, scale1_4, theta1_4 = calculate_FCOR_4n4p_C56(data_4n1, data_4p1)
fcr1_5, scale1_5, theta1_5 = calculate_FCOR_5n5p_C56(data_5n1, data_5p1)
print("Scale Values: ", scale1_4)
print("Angle vals (deg): ", np.rad2deg(theta1_4))

fcr1_4 = np.hstack(fcr1_4) 
y_vals1_4 = fcr1_4[0, :]
z_vals1_4 = fcr1_4[1, :]
print("Y Coords: " , y_vals1_4)
print("Z Coords: " , z_vals1_4)
x_vals = np.linspace(0,0, len(y_vals1_4))

fig1_4 = plt.figure(5,figsize=(10,8))
ax1_4 = fig1_4.add_subplot(111,projection='3d')
fig1_4.canvas.manager.set_window_title('Model 1 C56 4n/4p')
ax1_4.scatter(x_vals,y_vals1_4,z_vals1_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals1_4)):
    ax1_4.text(
        x_vals[i], 
        y_vals1_4[i], 
        z_vals1_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals1_4[i]:.2f}, {z_vals1_4[i]:.2f})",
        fontsize=8
    )

ax1_4.set_xlabel("X-Axis (Locked)")
ax1_4.set_ylabel("Y-Axis (mm)")
ax1_4.set_zlabel("Z-Axis (mm)")
ax1_4.set_title("Model 1 C56 4n/4p")
plt.show()
fig1_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 1/C56/Model_1_COR_4N4P_C56.png', dpi = 300)

fcr1_5 = np.hstack(fcr1_5) 
x_vals1_5 = fcr1_5[0, :]
z_vals1_5 = fcr1_5[1, :]
print("X Coords: " , x_vals1_5)
print("Z Coords: " , z_vals1_5)

y_vals = np.linspace(0,0, len(x_vals1_5))
fig1_5 = plt.figure(5,figsize=(10,8))
ax1_5 = fig1_5.add_subplot(111,projection='3d')
fig1_5.canvas.manager.set_window_title('Model 15 C45 5n/5p')
ax1_5.scatter(y_vals,x_vals1_5,z_vals1_5, c = 'r', marker = 'o')

for i in range(len(x_vals1_5)):
    ax1_5.text(
        y_vals[i], 
        x_vals1_5[i], 
        z_vals1_5[i],
        f"{i}({x_vals1_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals1_5[i]:.2f})",
        fontsize=8
    )

ax1_5.set_xlabel("Y-Axis (locked)")
ax1_5.set_ylabel("X-Axis (mm)")
ax1_5.set_zlabel("Z-Axis (mm)")
ax1_5.set_title("Model 1 C56 5n/5p")

plt.show()
fig1_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 1/C56/Model_1_COR_5N5P_C56.png', dpi = 300)



data_4n3, data_4p3, data_5n3, data_5p3= read_file56_15("3")
fcr3_4, scale3_4, theta3_4 = calculate_FCOR_4n4p_C56(data_4n3, data_4p3)
fcr3_5, scale3_5, theta3_5 = calculate_FCOR_5n5p_C56(data_5n3, data_5p3)
print("Scale Values: ", scale3_4)
print("Angle vals (deg): ", np.rad2deg(theta3_4))

fcr3_4 = np.hstack(fcr3_4) 
y_vals3_4 = fcr3_4[0, :]
z_vals3_4 = fcr3_4[1, :]
print("Y Coords: " , y_vals3_4)
print("Z Coords: " , z_vals3_4)
x_vals = np.linspace(0,0, len(y_vals3_4))

fig3_4 = plt.figure(5,figsize=(10,8))
ax3_4 = fig3_4.add_subplot(111,projection='3d')
fig3_4.canvas.manager.set_window_title('Model 1 C56 4n/4p')
ax3_4.scatter(x_vals,y_vals3_4,z_vals3_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals3_4)):
    ax3_4.text(
        x_vals[i], 
        y_vals3_4[i], 
        z_vals3_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals3_4[i]:.2f}, {z_vals3_4[i]:.2f})",
        fontsize=8
    )

ax3_4.set_xlabel("X-Axis (Locked)")
ax3_4.set_ylabel("Y-Axis (mm)")
ax3_4.set_zlabel("Z-Axis (mm)")
ax3_4.set_title("Model 3 C56 4n/4p")
plt.show()
fig3_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 3/C56/Model_3_COR_4N4P_C56.png', dpi = 300)

fcr3_5 = np.hstack(fcr3_5) 
x_vals3_5 = fcr3_5[0, :]
z_vals3_5 = fcr3_5[1, :]
print("X Coords: " , x_vals3_5)
print("Z Coords: " , z_vals3_5)

y_vals = np.linspace(0,0, len(x_vals3_5))
fig3_5 = plt.figure(5,figsize=(10,8))
ax3_5 = fig3_5.add_subplot(111,projection='3d')
fig3_5.canvas.manager.set_window_title('Model 3 C45 5n/5p')
ax3_5.scatter(y_vals,x_vals3_5,z_vals3_5, c = 'r', marker = 'o')

for i in range(len(x_vals3_5)):
    ax3_5.text(
        y_vals[i], 
        x_vals3_5[i], 
        z_vals3_5[i],
        f"{i}({x_vals3_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals3_5[i]:.2f})",
        fontsize=8
    )

ax3_5.set_xlabel("Y-Axis (locked)")
ax3_5.set_ylabel("X-Axis (mm)")
ax3_5.set_zlabel("Z-Axis (mm)")
ax3_5.set_title("Model 3 C56 5n/5p")

plt.show()
fig3_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 3/C56/Model_3_COR_5N5P_C56.png', dpi = 300)


data_4n4, data_4p4, data_5n4, data_5p4= read_file56_15("4")
fcr4_4, scale4_4, theta4_4 = calculate_FCOR_4n4p_C56(data_4n4, data_4p4)
fcr4_5, scale4_5, theta4_5 = calculate_FCOR_5n5p_C56(data_5n4, data_5p4)
print("Scale Values: ", scale4_4)
print("Angle vals (deg): ", np.rad2deg(theta4_4))

fcr4_4 = np.hstack(fcr4_4) 
y_vals4_4 = fcr4_4[0, :]
z_vals4_4 = fcr4_4[1, :]
print("Y Coords: " , y_vals4_4)
print("Z Coords: " , z_vals4_4)
x_vals = np.linspace(0,0, len(y_vals4_4))

fig4_4 = plt.figure(5,figsize=(10,8))
ax4_4 = fig4_4.add_subplot(111,projection='3d')
fig4_4.canvas.manager.set_window_title('Model 4 C56 4n/4p')
ax4_4.scatter(x_vals,y_vals4_4,z_vals4_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals4_4)):
    ax4_4.text(
        x_vals[i], 
        y_vals4_4[i], 
        z_vals4_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals4_4[i]:.2f}, {z_vals4_4[i]:.2f})",
        fontsize=8
    )

ax4_4.set_xlabel("X-Axis (Locked)")
ax4_4.set_ylabel("Y-Axis (mm)")
ax4_4.set_zlabel("Z-Axis (mm)")
ax4_4.set_title("Model 4 C56 4n/4p")
plt.show()
fig4_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 4/C56/Model_4_COR_4N4P_C56.png', dpi = 300)

fcr4_5 = np.hstack(fcr4_5) 
x_vals4_5 = fcr4_5[0, :]
z_vals4_5 = fcr4_5[1, :]
print("X Coords: " , x_vals4_5)
print("Z Coords: " , z_vals4_5)

y_vals = np.linspace(0,0, len(x_vals4_5))
fig4_5 = plt.figure(5,figsize=(10,8))
ax4_5 = fig4_5.add_subplot(111,projection='3d')
fig4_5.canvas.manager.set_window_title('Model 4 C56 5n/5p')
ax4_5.scatter(y_vals,x_vals4_5,z_vals4_5, c = 'r', marker = 'o')

for i in range(len(x_vals4_5)):
    ax4_5.text(
        y_vals[i], 
        x_vals4_5[i], 
        z_vals4_5[i],
        f"{i}({x_vals4_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals4_5[i]:.2f})",
        fontsize=8
    )

ax4_5.set_xlabel("Y-Axis (locked)")
ax4_5.set_ylabel("X-Axis (mm)")
ax4_5.set_zlabel("Z-Axis (mm)")
ax4_5.set_title("Model 4 C56 5n/5p")

plt.show()
fig4_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 4/C56/Model_4_COR_5N5P_C56.png', dpi = 300)


data_4n5, data_4p5, data_5n5, data_5p5= read_file56_15("5")
fcr5_4, scale5_4, theta5_4 = calculate_FCOR_4n4p_C56(data_4n5, data_4p5)
fcr5_5, scale5_5, theta5_5 = calculate_FCOR_5n5p_C56(data_5n5, data_5p5)
print("Scale Values: ", scale5_4)
print("Angle vals (deg): ", np.rad2deg(theta5_4))

fcr5_4 = np.hstack(fcr5_4) 
y_vals5_4 = fcr5_4[0, :]
z_vals5_4 = fcr5_4[1, :]
print("Y Coords: " , y_vals5_4)
print("Z Coords: " , z_vals5_4)
x_vals = np.linspace(0,0, len(y_vals5_4))

fig5_4 = plt.figure(5,figsize=(10,8))
ax5_4 = fig5_4.add_subplot(111,projection='3d')
fig5_4.canvas.manager.set_window_title('Model 4 C56 4n/4p')
ax5_4.scatter(x_vals,y_vals5_4,z_vals5_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals5_4)):
    ax5_4.text(
        x_vals[i], 
        y_vals5_4[i], 
        z_vals5_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals5_4[i]:.2f}, {z_vals5_4[i]:.2f})",
        fontsize=8
    )

ax5_4.set_xlabel("X-Axis (Locked)")
ax5_4.set_ylabel("Y-Axis (mm)")
ax5_4.set_zlabel("Z-Axis (mm)")
ax5_4.set_title("Model 5 C56 4n/4p")
plt.show()
fig5_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 5/C56/Model_5_COR_4N4P_C56.png', dpi = 300)

fcr5_5 = np.hstack(fcr5_5) 
x_vals5_5 = fcr5_5[0, :]
z_vals5_5 = fcr5_5[1, :]
print("X Coords: " , x_vals5_5)
print("Z Coords: " , z_vals5_5)

y_vals = np.linspace(0,0, len(x_vals5_5))
fig5_5 = plt.figure(5,figsize=(10,8))
ax5_5 = fig5_5.add_subplot(111,projection='3d')
fig5_5.canvas.manager.set_window_title('Model 5 C56 5n/5p')
ax5_5.scatter(y_vals,x_vals5_5,z_vals5_5, c = 'r', marker = 'o')

for i in range(len(x_vals5_5)):
    ax5_5.text(
        y_vals[i], 
        x_vals5_5[i], 
        z_vals5_5[i],
        f"{i}({x_vals5_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals5_5[i]:.2f})",
        fontsize=8
    )

ax5_5.set_xlabel("Y-Axis (locked)")
ax5_5.set_ylabel("X-Axis (mm)")
ax5_5.set_zlabel("Z-Axis (mm)")
ax5_5.set_title("Model 5 C56 5n/5p")

plt.show()
fig5_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 5/C56/Model_5_COR_5N5P_C56.png', dpi = 300)


data_4n14, data_4p14, data_5n14, data_5p14= read_file56_15("14")
fcr14_4, scale14_4, theta14_4 = calculate_FCOR_4n4p_C56(data_4n14, data_4p14)
fcr14_5, scale14_5, theta14_5 = calculate_FCOR_5n5p_C56(data_5n14, data_5p14)
print("Scale Values: ", scale14_4)
print("Angle vals (deg): ", np.rad2deg(theta14_4))

fcr14_4 = np.hstack(fcr14_4) 
y_vals14_4 = fcr14_4[0, :]
z_vals14_4 = fcr14_4[1, :]
print("Y Coords: " , y_vals14_4)
print("Z Coords: " , z_vals14_4)
x_vals = np.linspace(0,0, len(y_vals14_4))

fig14_4 = plt.figure(5,figsize=(10,8))
ax14_4 = fig14_4.add_subplot(111,projection='3d')
fig14_4.canvas.manager.set_window_title('Model 14 C56 4n/4p')
ax14_4.scatter(x_vals,y_vals14_4,z_vals14_4, c = 'r', marker = 'o')

offset = 0.01
for i in range(len(y_vals14_4)):
    ax14_4.text(
        x_vals[i], 
        y_vals14_4[i], 
        z_vals14_4[i],
        f"{i}({x_vals[i]:.2f}, {y_vals14_4[i]:.2f}, {z_vals14_4[i]:.2f})",
        fontsize=8
    )

ax14_4.set_xlabel("X-Axis (Locked)")
ax14_4.set_ylabel("Y-Axis (mm)")
ax14_4.set_zlabel("Z-Axis (mm)")
ax14_4.set_title("Model 14 C56 4n/4p")
plt.show()
fig14_4.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 14/C56/Model_14_COR_4N4P_C56.png', dpi = 300)

fcr14_5 = np.hstack(fcr14_5) 
x_vals14_5 = fcr14_5[0, :]
z_vals14_5 = fcr14_5[1, :]
print("X Coords: " , x_vals14_5)
print("Z Coords: " , z_vals14_5)

y_vals = np.linspace(0,0, len(x_vals14_5))
fig14_5 = plt.figure(5,figsize=(10,8))
ax14_5 = fig14_5.add_subplot(111,projection='3d')
fig14_5.canvas.manager.set_window_title('Model 5 C56 5n/5p')
ax14_5.scatter(y_vals,x_vals14_5,z_vals14_5, c = 'r', marker = 'o')

for i in range(len(x_vals14_5)):
    ax14_5.text(
        y_vals[i], 
        x_vals14_5[i], 
        z_vals14_5[i],
        f"{i}({x_vals14_5[i]:.2f}, {y_vals[i]:.2f}, {z_vals14_5[i]:.2f})",
        fontsize=8
    )

ax14_5.set_xlabel("Y-Axis (locked)")
ax14_5.set_ylabel("X-Axis (mm)")
ax14_5.set_zlabel("Z-Axis (mm)")
ax14_5.set_title("Model 14 C56 5n/5p")

plt.show()
fig14_5.savefig('New_CenterOfRotation/Finite_COR/Plots/Model 14/C56/Model_14_COR_5N5P_C56.png', dpi = 300)

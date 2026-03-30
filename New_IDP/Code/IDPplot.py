import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import itertools
import tkinter as tk
from tkinter import filedialog
from pathlib import Path


def read_file(model):

    data_path = (f'New_IDP/Data Files/IDP_M{model}.xlsx')
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None)
    #Get node labels
    node_labels = df_all.iloc[3].dropna().tolist()
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

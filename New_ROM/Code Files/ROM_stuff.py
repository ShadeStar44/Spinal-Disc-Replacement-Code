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
#This file is for relative range of motion of the C4-C5 disc region,
#with data coming from an Abuqus FE model. Data was pulled by Alyssa Brayer and Andrew Tritle and put into .xlsx format
#========================================================================================================================

def read_file(model):

    data_path = (f'New_ROM/Data Files/Model {model} ROM Data.xlsx')
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None)
    #Get node labels
    node_labels = df_all.iloc[1].dropna().tolist()  # row 4 (index=3 in zero-based)
    print("Node Labels Found:", node_labels)

    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None, skiprows = 5)
    data_4n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_4n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
    
    #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="4P", header=None, skiprows = 5)
    data_4p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_4p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
    
        #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None, skiprows = 5)
    data_5n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_5n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
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
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 

            #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="6N", header=None, skiprows = 5)
    data_6n = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_6n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
    
    #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="6P", header=None, skiprows = 5)
    data_6p = {}
    for i, label in enumerate(node_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_6p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "x_vals": cols.iloc[:, 1].to_numpy(),
            "y_vals": cols.iloc[:, 2].to_numpy(),
            "z_vals": cols.iloc[:, 3].to_numpy()
        } 
    
    print("Data Read Succesfully")
    return data_4n, data_4p, data_5n, data_5p, data_6n, data_6n, node_labels

def make_relative(top, bottom):
    return top - bottom

def RMSE(model1, model2, motion):
    #Read in data for desired two models to be compared
    data4n_1, data4p_1, data5n_1, data5p_1, data6n_1, data6p_1, node_labels = read_file(model1)
    data4n_2, data4p_2, data5n_2, data5p_2, data6n_2, data6p_2, node_labels = read_file(model2)

    #Specify desired motion, decides what will be plotted
    if (motion == '4N-4P'):
        data_n_1 = data4n_1
        data_p_1 = data4p_1

        data_n_2 = data4n_2
        data_p_2 = data4p_2
    elif (motion == '5N-5P'):
        data_n_1 = data5n_1
        data_p_1 = data5p_1
        
        data_n_2 = data5n_2
        data_p_2 = data5p_2
    elif (motion == '6N-6P'):
        data_n_1 = data6n_1
        data_p_1 = data6p_1

        data_n_2 = data6n_2
        data_p_2 = data6p_2


    #Iterate through all facet pairs
    for label in node_labels:
        if (label == 'PART-2-1.LOADNODE'): 
            C3_n_x_vals = np.rad2deg(data_n_1[label]["x_vals"])
            C3_p_x_vals = np.rad2deg(data_p_1[label]["x_vals"])

            C3_n_y_vals = np.rad2deg(data_n_1[label]["y_vals"])
            C3_p_y_vals = np.rad2deg(data_p_1[label]["y_vals"])

            C3_n_z_vals = np.rad2deg(data_n_1[label]["z_vals"])
            C3_p_z_vals = np.rad2deg(data_p_1[label]["z_vals"])

            C3_n_x_vals_2 = np.rad2deg(data_n_2[label]["x_vals"])
            C3_p_x_vals_2 = np.rad2deg(data_p_2[label]["x_vals"])

            C3_n_y_vals_2 = np.rad2deg(data_n_2[label]["y_vals"])
            C3_p_y_vals_2 = np.rad2deg(data_p_2[label]["y_vals"])

            C3_n_z_vals_2 = np.rad2deg(data_n_2[label]["z_vals"])
            C3_p_z_vals_2 = np.rad2deg(data_p_2[label]["z_vals"])

        elif (label == 'PART-2-1.N-C4-EP'): #If C4
            C4_n_x_vals = np.rad2deg(data_n_1[label]["x_vals"])
            C4_p_x_vals = np.rad2deg(data_p_1[label]["x_vals"])

            C4_n_y_vals = np.rad2deg(data_n_1[label]["y_vals"])
            C4_p_y_vals = np.rad2deg(data_p_1[label]["y_vals"])

            C4_n_z_vals = np.rad2deg(data_n_1[label]["z_vals"])
            C4_p_z_vals = np.rad2deg(data_p_1[label]["z_vals"])

            C4_n_x_vals_2 = np.rad2deg(data_n_2[label]["x_vals"])
            C4_p_x_vals_2 = np.rad2deg(data_p_2[label]["x_vals"])

            C4_n_y_vals_2 = np.rad2deg(data_n_2[label]["y_vals"])
            C4_p_y_vals_2 = np.rad2deg(data_p_2[label]["y_vals"])

            C4_n_z_vals_2 = np.rad2deg(data_n_2[label]["z_vals"])
            C4_p_z_vals_2 = np.rad2deg(data_p_2[label]["z_vals"])

            
        elif (label == 'PART-2-1.N-C5-EP'):
            C5_n_x_vals = np.rad2deg(data_n_1[label]["x_vals"])
            C5_p_x_vals = np.rad2deg(data_p_1[label]["x_vals"])

            C5_n_y_vals = np.rad2deg(data_n_1[label]["y_vals"])
            C5_p_y_vals = np.rad2deg(data_p_1[label]["y_vals"])

            C5_n_z_vals = np.rad2deg(data_n_1[label]["z_vals"])
            C5_p_z_vals = np.rad2deg(data_p_1[label]["z_vals"])

            C5_n_x_vals_2 = np.rad2deg(data_n_2[label]["x_vals"])
            C5_p_x_vals_2 = np.rad2deg(data_p_2[label]["x_vals"])

            C5_n_y_vals_2 = np.rad2deg(data_n_2[label]["y_vals"])
            C5_p_y_vals_2 = np.rad2deg(data_p_2[label]["y_vals"])

            C5_n_z_vals_2 = np.rad2deg(data_n_2[label]["z_vals"])
            C5_p_z_vals_2 = np.rad2deg(data_p_2[label]["z_vals"])

        elif (label == 'PART-2-1.N-C6-EP'):
            C6_n_x_vals = np.rad2deg(data_n_1[label]["x_vals"])
            C6_p_x_vals = np.rad2deg(data_p_1[label]["x_vals"])

            C6_n_y_vals = np.rad2deg(data_n_1[label]["y_vals"])
            C6_p_y_vals = np.rad2deg(data_p_1[label]["y_vals"])

            C6_n_z_vals = np.rad2deg(data_n_1[label]["z_vals"])
            C6_p_z_vals = np.rad2deg(data_p_1[label]["z_vals"])

            C6_n_x_vals_2 = np.rad2deg(data_n_2[label]["x_vals"])
            C6_p_x_vals_2 = np.rad2deg(data_p_2[label]["x_vals"])

            C6_n_y_vals_2 = np.rad2deg(data_n_2[label]["y_vals"])
            C6_p_y_vals_2 = np.rad2deg(data_p_2[label]["y_vals"])

            C6_n_z_vals_2 = np.rad2deg(data_n_2[label]["z_vals"])
            C6_p_z_vals_2 = np.rad2deg(data_p_2[label]["z_vals"])


    #========================
    C3_x_vals = np.concatenate((np.flip(C3_n_x_vals[0:20]), C3_p_x_vals[1:20]))
    C3_y_vals = np.concatenate((np.flip(C3_n_y_vals[0:20]), C3_p_y_vals[1:20]))
    C3_z_vals = np.concatenate((np.flip(C3_n_z_vals[0:20]), C3_p_z_vals[1:20]))

    C3_x_vals_2 = np.concatenate((np.flip(C3_n_x_vals_2[0:20]), C3_p_x_vals_2[1:20]))
    C3_y_vals_2 = np.concatenate((np.flip(C3_n_y_vals_2[0:20]), C3_p_y_vals_2[1:20]))
    C3_z_vals_2 = np.concatenate((np.flip(C3_n_z_vals_2[0:20]), C3_p_z_vals_2[1:20]))

    #=========================
    C4_x_vals = np.concatenate((np.flip(C4_n_x_vals[0:20]), C4_p_x_vals[1:20]))
    C4_y_vals = np.concatenate((np.flip(C4_n_y_vals[0:20]), C4_p_y_vals[1:20]))
    C4_z_vals = np.concatenate((np.flip(C4_n_z_vals[0:20]), C4_p_z_vals[1:20]))

    C4_x_vals_2 = np.concatenate((np.flip(C4_n_x_vals_2[0:20]), C4_p_x_vals_2[1:20]))
    C4_y_vals_2 = np.concatenate((np.flip(C4_n_y_vals_2[0:20]), C4_p_y_vals_2[1:20]))
    C4_z_vals_2 = np.concatenate((np.flip(C4_n_z_vals_2[0:20]), C4_p_z_vals_2[1:20]))

    #==========================

    C5_x_vals = np.concatenate((np.flip(C5_n_x_vals[0:20]), C5_p_x_vals[1:20]))
    C5_y_vals = np.concatenate((np.flip(C5_n_y_vals[0:20]), C5_p_y_vals[1:20]))
    C5_z_vals = np.concatenate((np.flip(C5_n_z_vals[0:20]), C5_p_z_vals[1:20]))

    C5_x_vals_2 = np.concatenate((np.flip(C5_n_x_vals_2[0:20]), C5_p_x_vals_2[1:20]))
    C5_y_vals_2 = np.concatenate((np.flip(C5_n_y_vals_2[0:20]), C5_p_y_vals_2[1:20]))
    C5_z_vals_2 = np.concatenate((np.flip(C5_n_z_vals_2[0:20]), C5_p_z_vals_2[1:20]))
    #===========================

    C6_x_vals = np.concatenate((np.flip(C6_n_x_vals[0:20]), C6_p_x_vals[1:20]))
    C6_y_vals = np.concatenate((np.flip(C6_n_y_vals[0:20]), C6_p_y_vals[1:20]))
    C6_z_vals = np.concatenate((np.flip(C6_n_z_vals[0:20]), C6_p_z_vals[1:20]))

    C6_x_vals_2 = np.concatenate((np.flip(C6_n_x_vals_2[0:20]), C6_p_x_vals_2[1:20]))
    C6_y_vals_2 = np.concatenate((np.flip(C6_n_y_vals_2[0:20]), C6_p_y_vals_2[1:20]))
    C6_z_vals_2 = np.concatenate((np.flip(C6_n_z_vals_2[0:20]), C6_p_z_vals_2[1:20]))
    #===========================


    C34_x_vals = make_relative(C3_x_vals, C4_x_vals)
    C34_y_vals = make_relative(C3_y_vals, C4_y_vals)
    C34_z_vals = make_relative(C3_z_vals, C4_z_vals)

    C34_x_vals_2 = make_relative(C3_x_vals_2, C4_x_vals_2)
    C34_y_vals_2 = make_relative(C3_y_vals_2, C4_y_vals_2)
    C34_z_vals_2 = make_relative(C3_z_vals_2, C4_z_vals_2)

    C45_x_vals = make_relative(C4_x_vals, C5_x_vals)
    C45_y_vals = make_relative(C4_y_vals, C5_y_vals)
    C45_z_vals = make_relative(C4_z_vals, C5_z_vals)

    C45_x_vals_2 = make_relative(C4_x_vals_2, C5_x_vals_2)
    C45_y_vals_2 = make_relative(C4_y_vals_2, C5_y_vals_2)
    C45_z_vals_2 = make_relative(C4_z_vals_2, C5_z_vals_2)

    C56_x_vals = make_relative(C5_x_vals, C6_x_vals)
    C56_y_vals = make_relative(C5_y_vals, C6_y_vals)
    C56_z_vals = make_relative(C5_z_vals, C6_z_vals)

    C56_x_vals_2 = make_relative(C5_x_vals_2, C6_x_vals_2)
    C56_y_vals_2 = make_relative(C5_y_vals_2, C6_y_vals_2)
    C56_z_vals_2 = make_relative(C5_z_vals_2, C6_z_vals_2)

   #=====================================================
    diff_C34_x_vals = np.zeros(len(C34_x_vals))
    diff_C34_y_vals = np.zeros(len(C34_y_vals))
    diff_C34_z_vals = np.zeros(len(C34_z_vals))

    diff_C45_x_vals = np.zeros(len(C34_x_vals))
    diff_C45_y_vals = np.zeros(len(C34_y_vals))
    diff_C45_z_vals = np.zeros(len(C34_z_vals))

    diff_C56_x_vals = np.zeros(len(C34_x_vals))
    diff_C56_y_vals = np.zeros(len(C34_y_vals))
    diff_C56_z_vals = np.zeros(len(C34_z_vals))

    for i in range(len(C34_x_vals)):

        diff_C34_x_vals[i] = C34_x_vals[i] - C34_x_vals_2[i]
        diff_C34_y_vals[i] = C34_y_vals[i] - C34_y_vals_2[i]
        diff_C34_z_vals[i] = C34_z_vals[i] - C34_z_vals_2[i]

        diff_C45_x_vals[i] = C45_x_vals[i] - C45_x_vals_2[i]
        diff_C45_y_vals[i] = C45_y_vals[i] - C45_y_vals_2[i]
        diff_C45_z_vals[i] = C45_z_vals[i] - C45_z_vals_2[i]

        diff_C56_x_vals[i] = C56_x_vals[i] - C56_x_vals_2[i]
        diff_C56_y_vals[i] = C56_y_vals[i] - C56_y_vals_2[i]
        diff_C56_z_vals[i] = C56_z_vals[i] - C56_z_vals_2[i]

    RMSE_C34_xvals = np.sqrt((1/len(C34_x_vals))*np.sum(diff_C34_x_vals)**2)
    RMSE_C34_yvals = np.sqrt((1/len(C34_y_vals))*np.sum(diff_C34_y_vals)**2)
    RMSE_C34_zvals = np.sqrt((1/len(C34_z_vals))*np.sum(diff_C34_z_vals)**2)

    RMSE_C45_xvals = np.sqrt((1/len(C45_x_vals))*np.sum(diff_C45_x_vals)**2)
    RMSE_C45_yvals = np.sqrt((1/len(C45_y_vals))*np.sum(diff_C45_y_vals)**2)
    RMSE_C45_zvals = np.sqrt((1/len(C45_z_vals))*np.sum(diff_C45_z_vals)**2)

    RMSE_C56_xvals = np.sqrt((1/len(C56_x_vals))*np.sum(diff_C56_x_vals)**2)
    RMSE_C56_yvals = np.sqrt((1/len(C56_y_vals))*np.sum(diff_C56_y_vals)**2)
    RMSE_C56_zvals = np.sqrt((1/len(C56_z_vals))*np.sum(diff_C56_z_vals)**2)

    return ((RMSE_C34_xvals, RMSE_C34_yvals, RMSE_C34_zvals,
            RMSE_C45_xvals, RMSE_C45_yvals, RMSE_C45_zvals,
            RMSE_C56_xvals, RMSE_C56_zvals, RMSE_C56_zvals))


def plot_ROM(model1):
    #Read in data for desired two models to be compared
    data_4n, data_4p, data_5n, data_5p, data_6n, data_6p, node_labels = read_file(model1)

    #Specify desired motion, decides what will be plotted


    #Iterate through all facet pairs
    for label in node_labels:
        if (label == 'PART-2-1.LOADNODE'):
            tn = -data_4n[label]["time"]
            tp = data_4p[label]["time"] 
            C3_4n_x_vals = np.rad2deg(data_4n[label]["x_vals"])
            C3_4p_x_vals = np.rad2deg(data_4p[label]["x_vals"])

            C3_4n_y_vals = np.rad2deg(data_4n[label]["y_vals"])
            C3_4p_y_vals = np.rad2deg(data_4p[label]["y_vals"])

            C3_4n_z_vals = np.rad2deg(data_4n[label]["z_vals"])
            C3_4p_z_vals = np.rad2deg(data_4p[label]["z_vals"])

            C3_5n_x_vals = np.rad2deg(data_5n[label]["x_vals"])
            C3_5p_x_vals = np.rad2deg(data_5p[label]["x_vals"])

            C3_5n_y_vals = np.rad2deg(data_5n[label]["y_vals"])
            C3_5p_y_vals = np.rad2deg(data_5p[label]["y_vals"])

            C3_5n_z_vals = np.rad2deg(data_5n[label]["z_vals"])
            C3_5p_z_vals = np.rad2deg(data_5p[label]["z_vals"])

            C3_6n_x_vals = np.rad2deg(data_6n[label]["x_vals"])
            C3_6p_x_vals = np.rad2deg(data_6p[label]["x_vals"])

            C3_6n_y_vals = np.rad2deg(data_6n[label]["y_vals"])
            C3_6p_y_vals = np.rad2deg(data_6p[label]["y_vals"])

            C3_6n_z_vals = np.rad2deg(data_6n[label]["z_vals"])
            C3_6p_z_vals = np.rad2deg(data_6p[label]["z_vals"])

        elif (label == 'PART-2-1.N-C4-EP'): #If C4
            C4_4n_x_vals = np.rad2deg(data_4n[label]["x_vals"])
            C4_4p_x_vals = np.rad2deg(data_4p[label]["x_vals"])

            C4_4n_y_vals = np.rad2deg(data_4n[label]["y_vals"])
            C4_4p_y_vals = np.rad2deg(data_4p[label]["y_vals"])

            C4_4n_z_vals = np.rad2deg(data_4n[label]["z_vals"])
            C4_4p_z_vals = np.rad2deg(data_4p[label]["z_vals"])

            C4_5n_x_vals = np.rad2deg(data_5n[label]["x_vals"])
            C4_5p_x_vals = np.rad2deg(data_5p[label]["x_vals"])

            C4_5n_y_vals = np.rad2deg(data_5n[label]["y_vals"])
            C4_5p_y_vals = np.rad2deg(data_5p[label]["y_vals"])

            C4_5n_z_vals = np.rad2deg(data_5n[label]["z_vals"])
            C4_5p_z_vals = np.rad2deg(data_5p[label]["z_vals"])

            C4_6n_x_vals = np.rad2deg(data_6n[label]["x_vals"])
            C4_6p_x_vals = np.rad2deg(data_6p[label]["x_vals"])

            C4_6n_y_vals = np.rad2deg(data_6n[label]["y_vals"])
            C4_6p_y_vals = np.rad2deg(data_6p[label]["y_vals"])

            C4_6n_z_vals = np.rad2deg(data_6n[label]["z_vals"])
            C4_6p_z_vals = np.rad2deg(data_6p[label]["z_vals"])

            
        elif (label == 'PART-2-1.N-C5-EP'):
            C5_4n_x_vals = np.rad2deg(data_4n[label]["x_vals"])
            C5_4p_x_vals = np.rad2deg(data_4p[label]["x_vals"])

            C5_4n_y_vals = np.rad2deg(data_4n[label]["y_vals"])
            C5_4p_y_vals = np.rad2deg(data_4p[label]["y_vals"])

            C5_4n_z_vals = np.rad2deg(data_4n[label]["z_vals"])
            C5_4p_z_vals = np.rad2deg(data_4p[label]["z_vals"])

            C5_5n_x_vals = np.rad2deg(data_5n[label]["x_vals"])
            C5_5p_x_vals = np.rad2deg(data_5p[label]["x_vals"])

            C5_5n_y_vals = np.rad2deg(data_5n[label]["y_vals"])
            C5_5p_y_vals = np.rad2deg(data_5p[label]["y_vals"])

            C5_5n_z_vals = np.rad2deg(data_5n[label]["z_vals"])
            C5_5p_z_vals = np.rad2deg(data_5p[label]["z_vals"])

            C5_6n_x_vals = np.rad2deg(data_6n[label]["x_vals"])
            C5_6p_x_vals = np.rad2deg(data_6p[label]["x_vals"])

            C5_6n_y_vals = np.rad2deg(data_6n[label]["y_vals"])
            C5_6p_y_vals = np.rad2deg(data_6p[label]["y_vals"])

            C5_6n_z_vals = np.rad2deg(data_6n[label]["z_vals"])
            C5_6p_z_vals = np.rad2deg(data_6p[label]["z_vals"])


        elif (label == 'PART-2-1.N-C6-EP'):
            C6_4n_x_vals = np.rad2deg(data_4n[label]["x_vals"])
            C6_4p_x_vals = np.rad2deg(data_4p[label]["x_vals"])

            C6_4n_y_vals = np.rad2deg(data_4n[label]["y_vals"])
            C6_4p_y_vals = np.rad2deg(data_4p[label]["y_vals"])

            C6_4n_z_vals = np.rad2deg(data_4n[label]["z_vals"])
            C6_4p_z_vals = np.rad2deg(data_4p[label]["z_vals"])

            C6_5n_x_vals = np.rad2deg(data_5n[label]["x_vals"])
            C6_5p_x_vals = np.rad2deg(data_5p[label]["x_vals"])

            C6_5n_y_vals = np.rad2deg(data_5n[label]["y_vals"])
            C6_5p_y_vals = np.rad2deg(data_5p[label]["y_vals"])

            C6_5n_z_vals = np.rad2deg(data_5n[label]["z_vals"])
            C6_5p_z_vals = np.rad2deg(data_5p[label]["z_vals"])

            C6_6n_x_vals = np.rad2deg(data_6n[label]["x_vals"])
            C6_6p_x_vals = np.rad2deg(data_6p[label]["x_vals"])

            C6_6n_y_vals = np.rad2deg(data_6n[label]["y_vals"])
            C6_6p_y_vals = np.rad2deg(data_6p[label]["y_vals"])

            C6_6n_z_vals = np.rad2deg(data_6n[label]["z_vals"])
            C6_6p_z_vals = np.rad2deg(data_6p[label]["z_vals"])

    t = np.concatenate((np.flip(tn[0:20]), tp[1:20]))
    #========================
    C3_4np_x_vals = np.concatenate((np.flip(C3_4n_x_vals[0:20]), C3_4p_x_vals[1:20]))
    C3_4np_y_vals = np.concatenate((np.flip(C3_4n_y_vals[0:20]), C3_4p_y_vals[1:20]))
    C3_4np_z_vals = np.concatenate((np.flip(C3_4n_z_vals[0:20]), C3_4p_z_vals[1:20]))

    C3_5np_x_vals = np.concatenate((np.flip(C3_5n_x_vals[0:20]), C3_5p_x_vals[1:20]))
    C3_5np_y_vals = np.concatenate((np.flip(C3_5n_y_vals[0:20]), C3_5p_y_vals[1:20]))
    C3_5np_z_vals = np.concatenate((np.flip(C3_5n_z_vals[0:20]), C3_5p_z_vals[1:20]))

    C3_6np_x_vals = np.concatenate((np.flip(C3_6n_x_vals[0:20]), C3_6p_x_vals[1:20]))
    C3_6np_y_vals = np.concatenate((np.flip(C3_6n_y_vals[0:20]), C3_6p_y_vals[1:20]))
    C3_6np_z_vals = np.concatenate((np.flip(C3_6n_z_vals[0:20]), C3_6p_z_vals[1:20]))

    #=========================

    C4_4np_x_vals = np.concatenate((np.flip(C4_4n_x_vals[0:20]), C4_4p_x_vals[1:20]))
    C4_4np_y_vals = np.concatenate((np.flip(C4_4n_y_vals[0:20]), C4_4p_y_vals[1:20]))
    C4_4np_z_vals = np.concatenate((np.flip(C4_4n_z_vals[0:20]), C4_4p_z_vals[1:20]))

    C4_5np_x_vals = np.concatenate((np.flip(C4_5n_x_vals[0:20]), C4_5p_x_vals[1:20]))
    C4_5np_y_vals = np.concatenate((np.flip(C4_5n_y_vals[0:20]), C4_5p_y_vals[1:20]))
    C4_5np_z_vals = np.concatenate((np.flip(C4_5n_z_vals[0:20]), C4_5p_z_vals[1:20]))

    C4_6np_x_vals = np.concatenate((np.flip(C4_6n_x_vals[0:20]), C4_6p_x_vals[1:20]))
    C4_6np_y_vals = np.concatenate((np.flip(C4_6n_y_vals[0:20]), C4_6p_y_vals[1:20]))
    C4_6np_z_vals = np.concatenate((np.flip(C4_6n_z_vals[0:20]), C4_6p_z_vals[1:20]))

    #==========================

    C5_4np_x_vals = np.concatenate((np.flip(C5_4n_x_vals[0:20]), C5_4p_x_vals[1:20]))
    C5_4np_y_vals = np.concatenate((np.flip(C5_4n_y_vals[0:20]), C5_4p_y_vals[1:20]))
    C5_4np_z_vals = np.concatenate((np.flip(C5_4n_z_vals[0:20]), C5_4p_z_vals[1:20]))

    C5_5np_x_vals = np.concatenate((np.flip(C5_5n_x_vals[0:20]), C5_5p_x_vals[1:20]))
    C5_5np_y_vals = np.concatenate((np.flip(C5_5n_y_vals[0:20]), C5_5p_y_vals[1:20]))
    C5_5np_z_vals = np.concatenate((np.flip(C5_5n_z_vals[0:20]), C5_5p_z_vals[1:20]))

    C5_6np_x_vals = np.concatenate((np.flip(C5_6n_x_vals[0:20]), C5_6p_x_vals[1:20]))
    C5_6np_y_vals = np.concatenate((np.flip(C5_6n_y_vals[0:20]), C5_6p_y_vals[1:20]))
    C5_6np_z_vals = np.concatenate((np.flip(C5_6n_z_vals[0:20]), C5_6p_z_vals[1:20]))
    #===========================

    C6_4np_x_vals = np.concatenate((np.flip(C6_4n_x_vals[0:20]), C6_4p_x_vals[1:20]))
    C6_4np_y_vals = np.concatenate((np.flip(C6_4n_y_vals[0:20]), C6_4p_y_vals[1:20]))
    C6_4np_z_vals = np.concatenate((np.flip(C6_4n_z_vals[0:20]), C6_4p_z_vals[1:20]))

    C6_5np_x_vals = np.concatenate((np.flip(C6_5n_x_vals[0:20]), C6_5p_x_vals[1:20]))
    C6_5np_y_vals = np.concatenate((np.flip(C6_5n_y_vals[0:20]), C6_5p_y_vals[1:20]))
    C6_5np_z_vals = np.concatenate((np.flip(C6_5n_z_vals[0:20]), C6_5p_z_vals[1:20]))

    C6_6np_x_vals = np.concatenate((np.flip(C6_6n_x_vals[0:20]), C6_6p_x_vals[1:20]))
    C6_6np_y_vals = np.concatenate((np.flip(C6_6n_y_vals[0:20]), C6_6p_y_vals[1:20]))
    C6_6np_z_vals = np.concatenate((np.flip(C6_6n_z_vals[0:20]), C6_6p_z_vals[1:20]))

    #===========================


    C34_4np_x_vals = make_relative(C3_4np_x_vals, C4_4np_x_vals)
    C34_4np_y_vals = make_relative(C3_4np_y_vals, C4_4np_y_vals)
    C34_4np_z_vals = make_relative(C3_4np_z_vals, C4_4np_z_vals)

    C34_5np_x_vals = make_relative(C3_5np_x_vals, C4_5np_x_vals)
    C34_5np_y_vals = make_relative(C3_5np_y_vals, C4_5np_y_vals)
    C34_5np_z_vals = make_relative(C3_5np_z_vals, C4_5np_z_vals)

    C34_6np_x_vals = make_relative(C3_6np_x_vals, C4_6np_x_vals)
    C34_6np_y_vals = make_relative(C3_6np_y_vals, C4_6np_y_vals)
    C34_6np_z_vals = make_relative(C3_6np_z_vals, C4_6np_z_vals)
    #===========================

    C45_4np_x_vals = make_relative(C4_4np_x_vals, C5_4np_x_vals)
    C45_4np_y_vals = make_relative(C4_4np_y_vals, C5_4np_y_vals)
    C45_4np_z_vals = make_relative(C4_4np_z_vals, C5_4np_z_vals)

    C45_5np_x_vals = make_relative(C4_5np_x_vals, C5_5np_x_vals)
    C45_5np_y_vals = make_relative(C4_5np_y_vals, C5_5np_y_vals)
    C45_5np_z_vals = make_relative(C4_5np_z_vals, C5_5np_z_vals)

    C45_6np_x_vals = make_relative(C4_6np_x_vals, C5_6np_x_vals)
    C45_6np_y_vals = make_relative(C4_6np_y_vals, C5_6np_y_vals)
    C45_6np_z_vals = make_relative(C4_6np_z_vals, C5_6np_z_vals)
    #===========================

    C56_4np_x_vals = make_relative(C5_4np_x_vals, C6_4np_x_vals)
    C56_4np_y_vals = make_relative(C5_4np_y_vals, C6_4np_y_vals)
    C56_4np_z_vals = make_relative(C5_4np_z_vals, C6_4np_z_vals)

    C56_5np_x_vals = make_relative(C5_5np_x_vals, C6_5np_x_vals)
    C56_5np_y_vals = make_relative(C5_5np_y_vals, C6_5np_y_vals)
    C56_5np_z_vals = make_relative(C5_5np_z_vals, C6_5np_z_vals)

    C56_6np_x_vals = make_relative(C5_6np_x_vals, C6_6np_x_vals)
    C56_6np_y_vals = make_relative(C5_6np_y_vals, C6_6np_y_vals)
    C56_6np_z_vals = make_relative(C5_6np_z_vals, C6_6np_z_vals)

   #=====================================================

    fig1, axs1 = plt.subplots(3, 1, figsize=(10, 13), sharex=True)

# --- Plot 1: u1z, u2z, u3z ---
    axs1[0].plot(t, C34_4np_x_vals, label='ROM X-axis')
    axs1[0].plot(t, C34_4np_y_vals, label='ROM Y-axis')
    axs1[0].plot(t, C34_4np_z_vals, label='ROM Z-axis')
    axs1[0].set_title(f'Model {model1} Relative ROM: Flexion/Extension, C3-4')
    axs1[0].set_ylabel('ROM (deg)')
    axs1[0].grid(True)
    axs1[0].legend()

# --- Plot 2: u1z5, u2z5, u3z5 ---
    axs1[1].plot(t, C34_5np_x_vals, label='ROM X-axis')
    axs1[1].plot(t, C34_5np_y_vals, label='ROM Y-axis')
    axs1[1].plot(t, C34_5np_z_vals, label='ROM Z-axis')
    axs1[1].set_title('Lateral Bending')
    axs1[1].set_ylabel('ROM (deg)')
    axs1[1].grid(True)
    axs1[1].legend()

# --- Plot 3: u1z6, u2z6, u3z6 ---
    axs1[2].plot(t, C34_6np_x_vals, label='ROM X-axis')
    axs1[2].plot(t, C34_6np_y_vals, label='ROM Y-axis')
    axs1[2].plot(t, C34_6np_z_vals, label='ROM Z-axis')
    axs1[2].set_title('Axial Rotation')
    axs1[2].set_xlabel('Time')
    axs1[2].set_ylabel('ROM (deg)')
    axs1[2].grid(True)
    axs1[2].legend()

    fig1.savefig(f"New_ROM/Plots/Model {model1}/Model_{model1}_ROM_C34.png", dpi = 300)
    plt.tight_layout()


    fig2, axs2 = plt.subplots(3, 1, figsize=(10, 13), sharex=True)

# --- Plot 1: u1z, u2z, u3z ---
    axs2[0].plot(t, C45_4np_x_vals, label='ROM X-axis')
    axs2[0].plot(t, C45_4np_y_vals, label='ROM Y-axis')
    axs2[0].plot(t, C45_4np_z_vals, label='ROM Z-axis')
    axs2[0].set_title(f'Model {model1} Relative ROM: Flexion/Extension, C4-5')
    axs2[0].set_ylabel('ROM (deg)')
    axs2[0].grid(True)
    axs2[0].legend()

# --- Plot 2: u1z5, u2z5, u3z5 ---
    axs2[1].plot(t, C45_5np_x_vals, label='ROM X-axis')
    axs2[1].plot(t, C45_5np_y_vals, label='ROM Y-axis')
    axs2[1].plot(t, C45_5np_z_vals, label='ROM Z-axis')
    axs2[1].set_title('Lateral Bending')
    axs2[1].set_ylabel('ROM (deg)')
    axs2[1].grid(True)
    axs2[1].legend()

# --- Plot 3: u1z6, u2z6, u3z6 ---
    axs2[2].plot(t, C45_6np_x_vals, label='ROM X-axis')
    axs2[2].plot(t, C45_6np_y_vals, label='ROM Y-axis')
    axs2[2].plot(t, C45_6np_z_vals, label='ROM Z-axis')
    axs2[2].set_title('Axial Rotation')
    axs2[2].set_xlabel('Time')
    axs2[2].set_ylabel('ROM (deg)')
    axs2[2].grid(True)
    axs2[2].legend()

    fig2.savefig(f"New_ROM/Plots/Model {model1}/Model_{model1}_ROM_C45.png", dpi = 300)
    plt.tight_layout()


    fig3, axs3 = plt.subplots(3, 1, figsize=(10, 13), sharex=True)

# --- Plot 1: u1z, u2z, u3z ---
    axs3[0].plot(t, C56_4np_x_vals, label='ROM X-axis')
    axs3[0].plot(t, C56_4np_y_vals, label='ROM Y-axis')
    axs3[0].plot(t, C56_4np_z_vals, label='ROM Z-axis')
    axs3[0].set_title(f'Model {model1} Relative ROM: Flexion/Extension, C5-6')
    axs3[0].set_ylabel('ROM (deg)')
    axs3[0].grid(True)
    axs3[0].legend()

# --- Plot 2: u1z5, u2z5, u3z5 ---
    axs3[1].plot(t, C56_5np_x_vals, label='ROM X-axis')
    axs3[1].plot(t, C56_5np_y_vals, label='ROM Y-axis')
    axs3[1].plot(t, C56_5np_z_vals, label='ROM Z-axis')
    axs3[1].set_title('Lateral Bending')
    axs3[1].set_ylabel('ROM (deg)')
    axs3[1].grid(True)
    axs3[1].legend()

# --- Plot 3: u1z6, u2z6, u3z6 ---
    axs3[2].plot(t, C56_6np_x_vals, label='ROM X-axis')
    axs3[2].plot(t, C56_6np_y_vals, label='ROM Y-axis')
    axs3[2].plot(t, C56_6np_z_vals, label='ROM Z-axis')
    axs3[2].set_title('Axial Rotation')
    axs3[2].set_xlabel('Time')
    axs3[2].set_ylabel('ROM (deg)')
    axs3[2].grid(True)
    axs3[2].legend()

    fig3.savefig(f"New_ROM/Plots/Model {model1}/Model_{model1}_ROM_C56.png", dpi = 300)
    plt.tight_layout()

    plt.show()


plot_ROM('1')



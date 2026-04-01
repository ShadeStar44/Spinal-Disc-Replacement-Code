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
        data_4n[label] = {
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
        data_4p[label] = {
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

((RMSE_C34_xvals, RMSE_C34_yvals, RMSE_C34_zvals,
            RMSE_C45_xvals, RMSE_C45_yvals, RMSE_C45_zvals,
            RMSE_C56_xvals, RMSE_C56_zvals, RMSE_C56_zvals)) = RMSE('15', '1', '4N-4P')

print(RMSE_C34_xvals, RMSE_C34_yvals, RMSE_C34_zvals,
            RMSE_C45_xvals, RMSE_C45_yvals, RMSE_C45_zvals,
            RMSE_C56_xvals, RMSE_C56_zvals, RMSE_C56_zvals)


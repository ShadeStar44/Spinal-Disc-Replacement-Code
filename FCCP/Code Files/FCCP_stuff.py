import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import itertools
import tkinter as tk
from tkinter import filedialog
from pathlib import Path
from scipy import linalg

def group_facets(labels):
    #Creating list, output will be a list of pairs
    pairs = []

    i = 0 #initializing index at 0
    for l in labels: #iterating through all facet labels
        if l.startswith("C6"): #if C6 vertebrae
            if l.endswith("UR"):
                r = labels[i-1] #UR is previous to UL
                if r in labels:
                    pairs.append((l,r))
        
        elif l.startswith("C5"): #if C5 vertebra
            if l.endswith("UR"):
                r = labels[i-1] #UR is previous to UL
                if r in labels:
                    pairs.append((l,r))
        
        elif l.startswith("C4"): #if C4 vertebrae
            if l.endswith("UR"):
                r = labels[i-1] #UR is previous to UL
                if r in labels:
                    pairs.append((l,r))
        
        elif l.startswith("C3"): #if C3 vertebrae
            if l.endswith("UR"):
                r = labels[i-1] #UR is previous to UL
                if r in labels:
                    pairs.append((l,r))
        i += 1
            
    return pairs


def read_file(model):

    data_path = (f'FCCP/Data Files/FCCP_M{model}.xlsx')
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None)
    #Get node labels
    facet_labels = df_all.iloc[2].dropna().tolist()  # row 3  
    print("Facet Labels Found:", facet_labels)
    #Pairing labels together 
    facet_pairs = group_facets(facet_labels)
    print("Facets Grouped: ", facet_pairs)
 
    #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="4N", header=None, skiprows = 4)
    data_4n = {}
    for i, label in enumerate(facet_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_4n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "XN1": cols.iloc[:, 1].to_numpy(),
            "XN2": cols.iloc[:, 2].to_numpy(),
            "XN3": cols.iloc[:, 3].to_numpy()
        } 
    
    #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="4P", header=None, skiprows = 4)
    data_4p = {}
    for i, label in enumerate(facet_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5]
        data_4p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "XN1": cols.iloc[:, 1].to_numpy(),
            "XN2": cols.iloc[:, 2].to_numpy(),
            "XN3": cols.iloc[:, 3].to_numpy()
        } 
    

        #Reading 'N' data
    df_all = pd.read_excel(data_path, sheet_name="5N", header=None, skiprows = 4)
    data_5n = {}
    for i, label in enumerate(facet_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_5n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "XN1": cols.iloc[:, 1].to_numpy(),
            "XN2": cols.iloc[:, 2].to_numpy(),
            "XN3": cols.iloc[:, 3].to_numpy()
        } 

        #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="5P", header=None, skiprows = 4)
    data_5p = {}
    for i, label in enumerate(facet_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5]
        data_5p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "XN1": cols.iloc[:, 1].to_numpy(),
            "XN2": cols.iloc[:, 2].to_numpy(),
            "XN3": cols.iloc[:, 3].to_numpy()
        } 
    
    df_all = pd.read_excel(data_path, sheet_name="6N", header=None, skiprows = 4)
    data_6n = {}
    for i, label in enumerate(facet_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5] 
        data_6n[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "XN1": cols.iloc[:, 1].to_numpy(),
            "XN2": cols.iloc[:, 2].to_numpy(),
            "XN3": cols.iloc[:, 3].to_numpy()
        } 

        #Reading 'P' data
    df_all = pd.read_excel(data_path, sheet_name="6P", header=None, skiprows = 4)
    data_6p = {}
    for i, label in enumerate(facet_labels):
        cols = df_all.iloc[:, i*5:(i+1)*5]
        data_5p[label] = {
            "time": cols.iloc[:, 0].to_numpy(),
            "XN1": cols.iloc[:, 1].to_numpy(),
            "XN2": cols.iloc[:, 2].to_numpy(),
            "XN3": cols.iloc[:, 3].to_numpy()
        } 

    print("Data Read Succesfully")
    return data_4n, data_4p, data_5n, data_5p, data_6n, data_6p, facet_pairs


def RMSE(model1, model2, motion):
    #Read in data for desired two models to be compared
    data4n_1, data4p_1, data5n_1, data5p_1, data6n_1, data6p_1, facet_pairs = read_file(model1)
    data4n_2, data4p_2, data5n_2, data5p_2, data6n_2, data6p_2, facet_pairs = read_file(model2)

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
    for left,right in facet_pairs:
        if left.startswith('C3'): #if C34 disc values, plot data on left and right plot
            left_n_XN1_C3 = data_n_1[left]["XN1"]
            left_p_XN1_C3 = data_p_1[left]["XN1"]
            right_n_XN1_C3 = data_n_1[right]["XN1"]
            right_p_XN1_C3 = data_p_1[right]["XN1"]

            left_n_XN2_C3 = data_n_1[left]["XN2"]
            left_p_XN2_C3 = data_p_1[left]["XN2"]
            right_n_XN2_C3 = data_n_1[right]["XN2"]
            right_p_XN2_C3 = data_p_1[right]["XN2"]

            left_n_XN3_C3 = data_n_1[left]["XN3"]
            left_p_XN3_C3 = data_p_1[left]["XN3"]
            right_n_XN3_C3 = data_n_1[right]["XN3"]
            right_p_XN3_C3 = data_p_1[right]["XN3"]

            left_n_XN1_C3_2 = data_n_2[left]["XN1"]
            left_p_XN1_C3_2 = data_p_2[left]["XN1"]
            right_n_XN1_C3_2 = data_n_2[right]["XN1"]
            right_p_XN1_C3_2 = data_p_2[right]["XN1"]

            left_n_XN2_C3_2 = data_n_2[left]["XN2"]
            left_p_XN2_C3_2 = data_p_2[left]["XN2"]
            right_n_XN2_C3_2 = data_n_2[right]["XN2"]
            right_p_XN2_C3_2 = data_p_2[right]["XN2"]

            left_n_XN3_C3_2 = data_n_2[left]["XN3"]
            left_p_XN3_C3_2 = data_p_2[left]["XN3"]
            right_n_XN3_C3_2 = data_n_2[right]["XN3"]
            right_p_XN3_C3_2 = data_p_2[right]["XN3"]


        elif left.startswith('C4'): #If C45 disc values, plot data on left and right plot
            left_n_XN1_C4 = data_n_1[left]["XN1"]
            left_p_XN1_C4 = data_p_1[left]["XN1"]
            right_n_XN1_C4 = data_n_1[right]["XN1"]
            right_p_XN1_C4 = data_p_1[right]["XN1"]

            left_n_XN2_C4 = data_n_1[left]["XN2"]
            left_p_XN2_C4 = data_p_1[left]["XN2"]
            right_n_XN2_C4 = data_n_1[right]["XN2"]
            right_p_XN2_C4 = data_p_1[right]["XN2"]

            left_n_XN3_C4 = data_n_1[left]["XN3"]
            left_p_XN3_C4 = data_p_1[left]["XN3"]
            right_n_XN3_C4 = data_n_1[right]["XN3"]
            right_p_XN3_C4 = data_p_1[right]["XN3"]

            left_n_XN1_C4_2 = data_n_2[left]["XN1"]
            left_p_XN1_C4_2 = data_p_2[left]["XN1"]
            right_n_XN1_C4_2 = data_n_2[right]["XN1"]
            right_p_XN1_C4_2 = data_p_2[right]["XN1"]

            left_n_XN2_C4_2 = data_n_2[left]["XN2"]
            left_p_XN2_C4_2 = data_p_2[left]["XN2"]
            right_n_XN2_C4_2 = data_n_2[right]["XN2"]
            right_p_XN2_C4_2 = data_p_2[right]["XN2"]

            left_n_XN3_C4_2 = data_n_2[left]["XN3"]
            left_p_XN3_C4_2 = data_p_2[left]["XN3"]
            right_n_XN3_C4_2 = data_n_2[right]["XN3"]
            right_p_XN3_C4_2 = data_p_2[right]["XN3"]

            
        elif left.startswith('C5'): #If C56 disc values, plot data on left and right plot
            left_n_XN1_C5 = data_n_1[left]["XN1"]
            left_p_XN1_C5 = data_p_1[left]["XN1"]
            right_n_XN1_C5 = data_n_1[right]["XN1"]
            right_p_XN1_C5 = data_p_1[right]["XN1"]

            left_n_XN2_C5 = data_n_1[left]["XN2"]
            left_p_XN2_C5 = data_p_1[left]["XN2"]
            right_n_XN2_C5 = data_n_1[right]["XN2"]
            right_p_XN2_C5 = data_p_1[right]["XN2"]

            left_n_XN3_C5 = data_n_1[left]["XN3"]
            left_p_XN3_C5 = data_p_1[left]["XN3"]
            right_n_XN3_C5 = data_n_1[right]["XN3"]
            right_p_XN3_C5 = data_p_1[right]["XN3"]

            left_n_XN1_C5_2 = data_n_2[left]["XN1"]
            left_p_XN1_C5_2 = data_p_2[left]["XN1"]
            right_n_XN1_C5_2 = data_n_2[right]["XN1"]
            right_p_XN1_C5_2 = data_p_2[right]["XN1"]

            left_n_XN2_C5_2 = data_n_2[left]["XN2"]
            left_p_XN2_C5_2 = data_p_2[left]["XN2"]
            right_n_XN2_C5_2 = data_n_2[right]["XN2"]
            right_p_XN2_C5_2 = data_p_2[right]["XN2"]

            left_n_XN3_C5_2 = data_n_2[left]["XN3"]
            left_p_XN3_C5_2 = data_p_2[left]["XN3"]
            right_n_XN3_C5_2 = data_n_2[right]["XN3"]
            right_p_XN3_C5_2 = data_p_2[right]["XN3"]


    #========================
    left_XN1_C3 = np.concatenate((np.flip(left_n_XN1_C3[0:20]), left_p_XN1_C3[1:20]))
    right_XN1_C3 = np.concatenate((np.flip(right_n_XN1_C3[0:20]), right_p_XN1_C3[1:20]))

    left_XN2_C3 = np.concatenate((np.flip(left_n_XN2_C3[0:20]), left_p_XN2_C3[1:20]))
    right_XN2_C3 = np.concatenate((np.flip(right_n_XN2_C3[0:20]), right_p_XN2_C3[1:20]))
        
    left_XN3_C3 = np.concatenate((np.flip(left_n_XN3_C3[0:20]), left_p_XN3_C3[1:20]))
    right_XN3_C3 = np.concatenate((np.flip(right_n_XN3_C3[0:20]), right_p_XN3_C3[1:20]))

    left_XN1_C3_2 = np.concatenate((np.flip(left_n_XN1_C3_2[0:20]), left_p_XN1_C3_2[1:20]))
    right_XN1_C3_2 = np.concatenate((np.flip(right_n_XN1_C3_2[0:20]), right_p_XN1_C3_2[1:20]))

    left_XN2_C3_2 = np.concatenate((np.flip(left_n_XN2_C3_2[0:20]), left_p_XN2_C3_2[1:20]))
    right_XN2_C3_2 = np.concatenate((np.flip(right_n_XN2_C3_2[0:20]), right_p_XN2_C3_2[1:20]))
        
    left_XN3_C3_2 = np.concatenate((np.flip(left_n_XN3_C3_2[0:20]), left_p_XN3_C3_2[1:20]))
    right_XN3_C3_2 = np.concatenate((np.flip(right_n_XN3_C3_2[0:20]), right_p_XN3_C3_2[1:20]))
    #=========================
    left_XN1_C4 = np.concatenate((np.flip(left_n_XN1_C4[0:20]), left_p_XN1_C3[1:20]))
    right_XN1_C4 = np.concatenate((np.flip(right_n_XN1_C4[0:20]), right_p_XN1_C3[1:20]))

    left_XN2_C4 = np.concatenate((np.flip(left_n_XN2_C4[0:20]), left_p_XN2_C4[1:20]))
    right_XN2_C4 = np.concatenate((np.flip(right_n_XN2_C4[0:20]), right_p_XN2_C4[1:20]))
        
    left_XN3_C4 = np.concatenate((np.flip(left_n_XN3_C4[0:20]), left_p_XN3_C4[1:20]))
    right_XN3_C4 = np.concatenate((np.flip(right_n_XN3_C4[0:20]), right_p_XN3_C4[1:20]))

    left_XN1_C4_2 = np.concatenate((np.flip(left_n_XN1_C4_2[0:20]), left_p_XN1_C4_2[1:20]))
    right_XN1_C4_2 = np.concatenate((np.flip(right_n_XN1_C4_2[0:20]), right_p_XN1_C4_2[1:20]))

    left_XN2_C4_2 = np.concatenate((np.flip(left_n_XN2_C4_2[0:20]), left_p_XN2_C4_2[1:20]))
    right_XN2_C4_2 = np.concatenate((np.flip(right_n_XN2_C4_2[0:20]), right_p_XN2_C4_2[1:20]))
        
    left_XN3_C4_2 = np.concatenate((np.flip(left_n_XN3_C4_2[0:20]), left_p_XN3_C4_2[1:20]))
    right_XN3_C4_2 = np.concatenate((np.flip(right_n_XN3_C4_2[0:20]), right_p_XN3_C4_2[1:20]))
    #==========================
    left_XN1_C5 = np.concatenate((np.flip(left_n_XN1_C5[0:20]), left_p_XN1_C5[1:20]))
    right_XN1_C5 = np.concatenate((np.flip(right_n_XN1_C5[0:20]), right_p_XN1_C5[1:20]))

    left_XN2_C5 = np.concatenate((np.flip(left_n_XN2_C5[0:20]), left_p_XN2_C5[1:20]))
    right_XN2_C5 = np.concatenate((np.flip(right_n_XN2_C5[0:20]), right_p_XN2_C5[1:20]))
        
    left_XN3_C5 = np.concatenate((np.flip(left_n_XN3_C5[0:20]), left_p_XN3_C5[1:20]))
    right_XN3_C5 = np.concatenate((np.flip(right_n_XN3_C5[0:20]), right_p_XN3_C5[1:20]))

    left_XN1_C5_2 = np.concatenate((np.flip(left_n_XN1_C5_2[0:20]), left_p_XN1_C5_2[1:20]))
    right_XN1_C5_2 = np.concatenate((np.flip(right_n_XN1_C5_2[0:20]), right_p_XN1_C5_2[1:20]))

    left_XN2_C5_2 = np.concatenate((np.flip(left_n_XN2_C5_2[0:20]), left_p_XN2_C5_2[1:20]))
    right_XN2_C5_2 = np.concatenate((np.flip(right_n_XN2_C5_2[0:20]), right_p_XN2_C5_2[1:20]))
        
    left_XN3_C5_2 = np.concatenate((np.flip(left_n_XN3_C5_2[0:20]), left_p_XN3_C5_2[1:20]))
    right_XN3_C5_2 = np.concatenate((np.flip(right_n_XN3_C5_2[0:20]), right_p_XN3_C5_2[1:20]))
    #===========================

    difference_XN1_C3_left = np.zeros(len(left_XN1_C3))
    difference_XN1_C3_right = np.zeros(len(left_XN1_C3))

    difference_XN2_C3_left = np.zeros(len(left_XN1_C3))
    difference_XN2_C3_right = np.zeros(len(left_XN1_C3))

    difference_XN3_C3_left = np.zeros(len(left_XN1_C3))
    difference_XN3_C3_right = np.zeros(len(left_XN1_C3))

    difference_XN1_C4_left = np.zeros(len(left_XN1_C3))
    difference_XN1_C4_right = np.zeros(len(left_XN1_C3))

    difference_XN2_C4_left = np.zeros(len(left_XN1_C3))
    difference_XN2_C4_right = np.zeros(len(left_XN1_C3))

    difference_XN3_C4_left = np.zeros(len(left_XN1_C3))
    difference_XN3_C4_right = np.zeros(len(left_XN1_C3))

    difference_XN1_C5_left = np.zeros(len(left_XN1_C3))
    difference_XN1_C5_right = np.zeros(len(left_XN1_C3))

    difference_XN2_C5_left = np.zeros(len(left_XN1_C3))
    difference_XN2_C5_right = np.zeros(len(left_XN1_C3))

    difference_XN3_C5_left = np.zeros(len(left_XN1_C3))
    difference_XN3_C5_right = np.zeros(len(left_XN1_C3))

   #=====================================================

    for i in range(len(left_XN1_C3)):
        difference_XN1_C3_left[i] = left_XN1_C3[i] - left_XN1_C3_2[i]
        difference_XN1_C3_right[i] = right_XN1_C3[i] - right_XN1_C3_2[i]

        difference_XN2_C3_left[i] = left_XN2_C3[i] - left_XN2_C3_2[i]
        difference_XN2_C3_right[i] = right_XN2_C3[i] - right_XN2_C3_2[i]

        difference_XN3_C3_left[i] = left_XN3_C3[i] - left_XN3_C3_2[i]
        difference_XN3_C3_right[i] = right_XN3_C3[i] - right_XN3_C3_2[i]

        difference_XN1_C4_left[i] = left_XN1_C4[i] - left_XN1_C4_2[i]
        difference_XN1_C4_right[i] = right_XN1_C4[i] - right_XN1_C4_2[i]

        difference_XN2_C4_left[i] = left_XN2_C4[i] - left_XN2_C4_2[i]
        difference_XN2_C4_right[i] = right_XN2_C4[i] - right_XN2_C4_2[i]

        difference_XN3_C4_left[i] = left_XN3_C4[i] - left_XN3_C4_2[i]
        difference_XN3_C4_right[i] = right_XN3_C4[i] - right_XN3_C4_2[i]
        
        difference_XN1_C5_left[i] = left_XN1_C5[i] - left_XN1_C5_2[i]
        difference_XN1_C5_right[i] = right_XN1_C5[i] - right_XN1_C5_2[i]

        difference_XN2_C5_left[i] = left_XN2_C5[i] - left_XN2_C5_2[i]
        difference_XN2_C5_right[i] = right_XN2_C5[i] - right_XN2_C5_2[i]

        difference_XN3_C5_left[i] = left_XN3_C5[i] - left_XN3_C5_2[i]
        difference_XN3_C5_right[i] = right_XN3_C5[i] - right_XN3_C5_2[i]

    RMSE_C34_left_XN1 = np.sqrt((1/len(left_XN1_C3))*np.sum(difference_XN1_C3_left)**2)
    RMSE_C34_right_XN1 = np.sqrt((1/len(right_XN1_C3))*np.sum(difference_XN1_C3_right)**2)

    RMSE_C34_left_XN2 = np.sqrt((1/len(left_XN1_C3))*np.sum(difference_XN2_C3_left)**2)
    RMSE_C34_right_XN2 = np.sqrt((1/len(right_XN1_C3))*np.sum(difference_XN2_C3_right)**2)

    RMSE_C34_left_XN3 = np.sqrt((1/len(left_XN1_C3))*np.sum(difference_XN3_C3_left)**2)
    RMSE_C34_right_XN3 = np.sqrt((1/len(right_XN1_C3))*np.sum(difference_XN3_C3_right)**2)

    RMSE_C45_left_XN1 = np.sqrt((1/len(left_XN1_C3))*np.sum(difference_XN1_C4_left)**2)
    RMSE_C45_right_XN1 = np.sqrt((1/len(right_XN1_C3))*np.sum(difference_XN1_C4_right)**2)

    RMSE_C45_left_XN2 = np.sqrt((1/len(left_XN1_C3))*np.sum(difference_XN2_C4_left)**2)
    RMSE_C45_right_XN2 = np.sqrt((1/len(right_XN1_C3))*np.sum(difference_XN2_C4_right)**2)

    RMSE_C45_left_XN3 = np.sqrt((1/len(left_XN1_C3))*np.sum(difference_XN3_C4_left)**2)
    RMSE_C45_right_XN3 = np.sqrt((1/len(right_XN1_C3))*np.sum(difference_XN3_C4_right)**2)

    RMSE_C56_left_XN1 = np.sqrt((1/len(left_XN1_C3))*np.sum(difference_XN1_C5_left)**2)
    RMSE_C56_right_XN1 = np.sqrt((1/len(right_XN1_C3))*np.sum(difference_XN1_C5_right)**2)

    RMSE_C56_left_XN2 = np.sqrt((1/len(left_XN1_C3))*np.sum(difference_XN2_C5_left)**2)
    RMSE_C56_right_XN2 = np.sqrt((1/len(right_XN1_C3))*np.sum(difference_XN2_C5_right)**2)

    RMSE_C56_left_XN3 = np.sqrt((1/len(left_XN1_C3))*np.sum(difference_XN3_C5_left)**2)
    RMSE_C56_right_XN3 = np.sqrt((1/len(right_XN1_C3))*np.sum(difference_XN3_C5_right)**2)

    return (RMSE_C34_left_XN1, RMSE_C34_right_XN1, RMSE_C34_left_XN2, RMSE_C34_right_XN2, RMSE_C34_left_XN3, RMSE_C34_right_XN3, 
                RMSE_C45_left_XN1, RMSE_C45_right_XN1, RMSE_C45_left_XN2, RMSE_C45_right_XN2, RMSE_C45_left_XN3, RMSE_C45_right_XN3,
                RMSE_C56_left_XN1, RMSE_C56_right_XN1, RMSE_C56_left_XN2, RMSE_C56_right_XN2, RMSE_C56_left_XN3, RMSE_C56_right_XN3)



(RMSE_C34_left_XN1, RMSE_C34_right_XN1, RMSE_C34_left_XN2, RMSE_C34_right_XN2, RMSE_C34_left_XN3, RMSE_C34_right_XN3, 
    RMSE_C45_left_XN1, RMSE_C45_right_XN1, RMSE_C45_left_XN2, RMSE_C45_right_XN2, RMSE_C45_left_XN3, RMSE_C45_right_XN3,
    RMSE_C56_left_XN1, RMSE_C56_right_XN1, RMSE_C56_left_XN2, RMSE_C56_right_XN2, RMSE_C56_left_XN3, RMSE_C56_right_XN3) = RMSE('15', '1', '4N-4P')

print((RMSE_C34_left_XN1, RMSE_C34_right_XN1, RMSE_C34_left_XN2, RMSE_C34_right_XN2, RMSE_C34_left_XN3, RMSE_C34_right_XN3, 
    RMSE_C45_left_XN1, RMSE_C45_right_XN1, RMSE_C45_left_XN2, RMSE_C45_right_XN2, RMSE_C45_left_XN3, RMSE_C45_right_XN3,
    RMSE_C56_left_XN1, RMSE_C56_right_XN1, RMSE_C56_left_XN2, RMSE_C56_right_XN2, RMSE_C56_left_XN3, RMSE_C56_right_XN3))

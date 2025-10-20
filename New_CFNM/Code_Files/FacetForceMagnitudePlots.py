import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import itertools
import tkinter as tk
from tkinter import filedialog
from pathlib import Path
#authors @amladow, @shadestar44

#This file is for plotting the force magnitude on the facet joints given data from an Abuqus model
#The data is stored in excel files

#----------------------------------------------------------------------------------------------------------------
#The following is a function that takes a list of labels (for facet data) and groups them together based on disc
#----------------------------------------------------------------------------------------------------------------
def group_facets(labels):
    #Creating list, output will be a list of pairs
    pairs = []

    i = 0 #initializing index at 0
    for l in labels: #iterating through all facet labels
        if l.startswith("6"): #if C6 vertebrae
            if l.endswith("UL"):
                r = labels[i-1] #UR is previous to UL
                if r in labels:
                    pairs.append((l,r))
        
        elif l.startswith("5"): #if C5 vertebra
            if l.endswith("UL"):
                r = labels[i-1] #UR is previous to UL
                if r in labels:
                    pairs.append((l,r))
        
        elif l.startswith("4"): #if C4 vertebrae
            if l.endswith("UL"):
                r = labels[i-1] #UR is previous to UL
                if r in labels:
                    pairs.append((l,r))
        
        elif l.startswith("3"): #if C3 vertebrae
            if l.endswith("UL"):
                r = labels[i-1] #UR is previous to UL
                if r in labels:
                    pairs.append((l,r))
        i += 1
            
    return pairs

#-------------------------------------------------------------------------------------------------------------
#The following is a function to read data from all excel files within a certain folder
#Separated by model so will take a folder for one model and seperate data into 4n/4p 5n/5p 6n/6p respectively
#-------------------------------------------------------------------------------------------------------------

def read_directory(model):
    #----- Get full data path -----
    data_path = Path(f'New_CFNM/Data_Files/{model}') #navigate to relative path in repository
    if not data_path.exists(): #return error if no directory found
        raise FileNotFoundError (f"Directory not found: {data_path}")
    
    #----- Loading Facet Labels -----
    df_all = pd.read_excel(next(data_path.glob('*.xlsx')), sheet_name="Sheet1", header=None) #pulls just first file in folder
    #Get facet labels
    facet_labels = df_all.iloc[3].dropna().tolist()  # row 4 (index=3 in zero-based)
    print("Facet Labels Found:", facet_labels)
    #Pairing labels together 
    facet_pairs = group_facets(facet_labels)
    print("Facets Grouped: ", facet_pairs)
    #Iterating through all files within given folder
    for entry in data_path.glob('*.xlsx'): #iterating through every file within the folder

        #Reading all data for 4 motion
        if entry.name.startswith("4NP"):
            df_data = pd.read_excel(entry, sheet_name="Sheet1", skiprows=4, nrows = 20) #skip first four rows
            data_4p = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*3:(i+1)*3]
                if cols.shape[1] == 3:
                    data_4p[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "CFNM": cols.iloc[:, 2].to_numpy()
                    }

            df_data = pd.read_excel(entry, sheet_name= "Sheet1", skiprows = 33)
            data_4n = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*3:(i+1)*3]
                if cols.shape[1] == 3:
                    data_4n[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "CFNM": cols.iloc[:, 2].to_numpy()
                    }
            print("4NP Data succesfully read")

        #Reading all data for 5 motion
        elif entry.name.startswith("5NP"):
            #------ Loading Data ------
            df_data = pd.read_excel(entry, sheet_name="Sheet1", skiprows=4, nrows = 20) #skip first four rows
            # Build dictionary
            data_5p = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*3:(i+1)*3]
                if cols.shape[1] == 3:
                    data_5p[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "CFNM": cols.iloc[:, 2].to_numpy()
                    }

            df_data = pd.read_excel(entry, sheet_name= "Sheet1", skiprows = 33)
            data_5n = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*3:(i+1)*3]
                if cols.shape[1] == 3:
                    data_5n[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "CFNM": cols.iloc[:, 2].to_numpy()
                    }
            print("5NP Data succesfully read")

        #Reading all data for 6 motion (axial rotation)
        elif entry.name.startswith("6NP"):
            df_data = pd.read_excel(entry, sheet_name="Sheet1", skiprows=4, nrows = 20) #skip first four rows
            data_6p = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*3:(i+1)*3]
                if cols.shape[1] == 3:
                    data_6p[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "CFNM": cols.iloc[:, 2].to_numpy()
                    }
            df_data = pd.read_excel(entry, sheet_name="Sheet1", skiprows=33)
            data_6n = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*3:(i+1)*3]
                if cols.shape[1] == 3:
                    data_6n[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "CFNM": cols.iloc[:, 2].to_numpy()
                    }
            print("6NP Data succesfully read")
        

    return data_4p, data_4n, data_5p, data_5n, data_6p, data_6n, facet_pairs

#--------------------------------------------------------------------------------------------------------------
#The following function takes a dictionary for P motion data, a dictionary for N motion data, a list of labels
#and a list of colors and plots the data with CFNM over moment
#--------------------------------------------------------------------------------------------------------------\

def plot_facet(data_p, data_n, pairs, model, motion):

    fig, ax = plt.subplots()
    colors = itertools.cycle(['r', 'g', 'b', 'c', 'm', 'y', 'k'])
    for left, right in pairs:
        color = next(colors)

        #Reading data for right side
        right_xn = data_n[right]["moment"]
        right_yn = data_n[right]["CFNM"]
        right_xp = data_p[right]["moment"]
        right_yp = data_p[right]["CFNM"]
        
        #Reading data for left side
        left_xn = data_n[left]["moment"]
        left_yn = data_n[left]["CFNM"]
        left_xp = data_p[left]["moment"]
        left_yp = data_p[left]["CFNM"]


        
        #left_x = np.concatenate((np.flip(left_xn[0:20]), left_xp))
        #right_x = np.concatenate((np.flip(right_xn[0:20]), right_xp))

        #----- Aside -----
        #Could Not Figure out for the life of me why the x values in the excel file are broken now,
        #so just hardcoded them in since it's the same for everything and it's working for now, will fix 
        #later if need be - Anders

        moment = [-1.92, -1.81, -1.71, -1.61, -1.52, -1.41, -1.32, -1.22, -1.13, 
                  -1.02, -0.96, -0.80, -0.72, -0.64, -0.54, -0.43, -0.33, -0.21, -0.12, 
                   0, 0.12, 0.21, 0.33, 0.43, 0.54, 0.64, 0.72, 0.80, 0.96, 
                   1.02, 1.13, 1.22, 1.32, 1.41, 1.52, 1.61, 1.71, 1.81, 1.92]
        
        left_y = np.concatenate((np.flip(left_yn[0:20]), left_yp[1:20]))
        print('left node y: ', left_y)

        ax.plot(moment, left_y, color=color, label=left)

        right_y = np.concatenate((np.flip(right_yn[0:20]), right_yp[1:20]))
        print('right node y:', right_y)

        ax.plot(moment, right_y, linestyle='-.', color=color, label=right)

    handles, labels = ax.get_legend_handles_labels()
    fig.set_figwidth(8)
    ax.set_title(f"Facet Contact Force Magntiude (CFNM) for {model} model under motion: {motion}")
    ax.set_xlabel('Moment (N-m)')
    ax.set_ylabel('Force (N)')
    plt.legend(handles=handles, labels = labels, loc='upper center', ncol=4)
    plt.show()
    fig.savefig(f"New_CFNM/Plots/Individual/{model}/{model}_{motion}.png", dpi = 300)


# =====================
#The following is a function to take two models and a given specific disk, and compare the facet force magnitude
#of the disk between the two models on different subplots
# =====================

#def plotfacet_compare():



# ===========================================
# Plot All Facet Pairs For Individual Models
# ===========================================

data4p_15, data4n_15, data5p_15, data5n_15, data6p_15, data6n_15, facet_pairs = read_directory('Intact')
data4p_14, data4n_14, data5p_14, data5n_14, data6p_14, data6n_14, facet_pairs = read_directory('FixedNoTether')
data4p_13, data4n_13, data5p_13, data5n_13, data6p_13, data6n_13, facet_pairs = read_directory('FixedTether')
data4p_12, data4n_12, data5p_12, data5n_12, data6p_12, data6n_12, facet_pairs = read_directory('LatPhysNoTether')
data4p_11, data4n_11, data5p_11, data5n_11, data6p_11, data6n_11, facet_pairs = read_directory('LatPhysTether')
data4p_10, data4n_10, data5p_10, data5n_10, data6p_10, data6n_10, facet_pairs = read_directory('APPhysNoTether')
data4p_9, data4n_9, data5p_9, data5n_9, data6p_9, data6n_9, facet_pairs = read_directory('APPhysTether')
data4p_8, data4n_8, data5p_8, data5n_8, data6p_8, data6n_8, facet_pairs = read_directory('PhysPhysNoTether')
data4p_7, data4n_7, data5p_7, data5n_7, data6p_7, data6n_7, facet_pairs = read_directory('PhysPhysTether')
data4p_6, data4n_6, data5p_6, data5n_6, data6p_6, data6n_6, facet_pairs = read_directory('LatSlideNoTether')
data4p_5, data4n_5, data5p_5, data5n_5, data6p_5, data6n_5, facet_pairs = read_directory('LatSlideTether')
data4p_4, data4n_4, data5p_4, data5n_4, data6p_4, data6n_4, facet_pairs = read_directory('APSlideNoTether')
data4p_3, data4n_3, data5p_3, data5n_3, data6p_3, data6n_3, facet_pairs = read_directory('APSlideTether')
data4p_2, data4n_2, data5p_2, data5n_2, data6p_2, data6n_2, facet_pairs = read_directory('SlideSlideNoTether')
data4p_1, data4n_1, data5p_1, data5n_1, data6p_1, data6n_1, facet_pairs = read_directory('SlideSlideTether')

#-----Plotting Intact model-----
#plot_facet(data4p_15, data4n_15, facet_pairs, model = 'Intact', motion = '4N-4P')
#plot_facet(data5p_15, data5n_15, facet_pairs, model = 'Intact', motion = '5N-5P')
#plot_facet(data6p_15, data6n_15, facet_pairs, model = 'Intact', motion = '6N-6P')

#-----Plotting FixedNoTether model-----
#plot_facet(data4p_14, data4n_14, facet_pairs, model = 'FixedNoTether', motion = '4N-4P')
#plot_facet(data5p_14, data5n_14, facet_pairs, model = 'FixedNoTether', motion = '5N-5P')
#plot_facet(data6p_14, data6n_14, facet_pairs, model = 'FixedNoTether', motion = '6N-6P')

#-----Plotting FixedTether model-----
#plot_facet(data4p_13, data4n_13, facet_pairs, model = 'FixedTether', motion = '4N-4P')
#plot_facet(data5p_13, data5n_13, facet_pairs, model = 'FixedTether', motion = '5N-5P')
#plot_facet(data6p_13, data6n_13, facet_pairs, model = 'FixedTether', motion = '6N-6P')

#-----Plotting LatPhysNoTether model-----
#plot_facet(data4p_12, data4n_12, facet_pairs, model = 'LatPhysNoTether', motion = '4N-4P')
#plot_facet(data5p_12, data5n_12, facet_pairs, model = 'LatPhysNoTether', motion = '5N-5P')
#plot_facet(data6p_12, data6n_12, facet_pairs, model = 'LatPhysNoTether', motion = '6N-6P')

#-----Plotting LatPhysTether model-----
#plot_facet(data4p_11, data4n_11, facet_pairs, model = 'LatPhysTether', motion = '4N-4P')
#plot_facet(data5p_11, data5n_11, facet_pairs, model = 'LatPhysTether', motion = '5N-5P')
#plot_facet(data6p_11, data6n_11, facet_pairs, model = 'LatPhysTether', motion = '6N-6P')

#-----Plotting APPhysNoTether model-----
#plot_facet(data4p_10, data4n_10, facet_pairs, model = 'APPhysNoTether', motion = '4N-4P')
#plot_facet(data5p_10, data5n_10, facet_pairs, model = 'APPhysNoTether', motion = '5N-5P')
#plot_facet(data6p_10, data6n_10, facet_pairs, model = 'APPhysNoTether', motion = '6N-6P')

#-----Plotting APPhysTether model-----
#plot_facet(data4p_9, data4n_9, facet_pairs, model = 'APPhysTether', motion = '4N-4P')
#plot_facet(data5p_9, data5n_9, facet_pairs, model = 'APPhysTether', motion = '5N-5P')
#plot_facet(data6p_9, data6n_9, facet_pairs, model = 'APPhysTether', motion = '6N-6P')

#-----Plotting PhysPhysNoTether model-----
#plot_facet(data4p_8, data4n_8, facet_pairs, model = 'PhysPhysNoTether', motion = '4N-4P')
#plot_facet(data5p_8, data5n_8, facet_pairs, model = 'PhysPhysNoTether', motion = '5N-5P')
#plot_facet(data6p_8, data6n_8, facet_pairs, model = 'PhysPhysNoTether', motion = '6N-6P')

#-----Plotting PhysPhysTether model-----
#plot_facet(data4p_7, data4n_7, facet_pairs, model = 'PhysPhysTether', motion = '4N-4P')
#plot_facet(data5p_7, data5n_7, facet_pairs, model = 'PhysPhysTether', motion = '5N-5P')
#plot_facet(data6p_7, data6n_7, facet_pairs, model = 'PhysPhysTether', motion = '6N-6P')

#-----Plotting LatSlideNoTether model-----
#plot_facet(data4p_6, data4n_6, facet_pairs, model = 'LatSlideNoTether', motion = '4N-4P')
#plot_facet(data5p_6, data5n_6, facet_pairs, model = 'LatSlideNoTether', motion = '5N-5P')
#plot_facet(data6p_6, data6n_6, facet_pairs, model = 'LatSlideNoTether', motion = '6N-6P')

#-----Plotting LatSlideTether model-----
#lot_facet(data4p_5, data4n_5, facet_pairs, model = 'LatSlideTether', motion = '4N-4P')
#plot_facet(data5p_5, data5n_5, facet_pairs, model = 'LatSlideTether', motion = '5N-5P')
#plot_facet(data6p_5, data6n_5, facet_pairs, model = 'LatSlideTether', motion = '6N-6P')

#-----Plotting APSlideNoTether model-----
#plot_facet(data4p_4, data4n_4, facet_pairs, model = 'APSlideNoTether', motion = '4N-4P')
#plot_facet(data5p_4, data5n_4, facet_pairs, model = 'APSlideNoTether', motion = '5N-5P')
#plot_facet(data6p_4, data6n_4, facet_pairs, model = 'APSlideNoTether', motion = '6N-6P')

#-----Plotting APSlideTether model-----
#plot_facet(data4p_3, data4n_3, facet_pairs, model = 'APSlideTether', motion = '4N-4P')
#plot_facet(data5p_3, data5n_3, facet_pairs, model = 'APSlideTether', motion = '5N-5P')
#plot_facet(data6p_3, data6n_3, facet_pairs, model = 'APSlideTether', motion = '6N-6P')

#-----Plotting SlideSlideNoTether-----
#plot_facet(data4p_2, data4n_2, facet_pairs, model = 'SlideSlideNoTether', motion = '4N-4P')
#plot_facet(data5p_2, data5n_2, facet_pairs, model = 'SlideSlideNoTether', motion = '5N-5P')
#plot_facet(data6p_2, data6n_2, facet_pairs, model = 'SlideSlideNoTether', motion = '6N-6P')

#-----Plotting SlideSlideTether-----
#plot_facet(data4p_1, data4n_1, facet_pairs, model = 'SlideSlideTether', motion = '4N-4P')
#plot_facet(data5p_1, data5n_1, facet_pairs, model = 'SlideSlideTether', motion = '5N-5P')
#plot_facet(data6p_1, data6n_1, facet_pairs, model = 'SlideSlideTether', motion = '6N-6P')
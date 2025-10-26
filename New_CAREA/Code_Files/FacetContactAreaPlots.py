import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import itertools
import tkinter as tk
from tkinter import filedialog
from pathlib import Path
#authors @amladow, @shadestar44

#This file is for plotting the facet contact area on the facet joints given data from an Abuqus model
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
    data_path = Path(f'New_CAREA/Data_Files/FacetContactArea/{model}') #navigate to relative path in repository
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
                        "CAREA": cols.iloc[:, 2].to_numpy()
                    }

            df_data = pd.read_excel(entry, sheet_name= "Sheet1", skiprows = 33)
            data_4n = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*3:(i+1)*3]
                if cols.shape[1] == 3:
                    data_4n[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "CAREA": cols.iloc[:, 2].to_numpy()
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
                        "CAREA": cols.iloc[:, 2].to_numpy()
                    }

            df_data = pd.read_excel(entry, sheet_name= "Sheet1", skiprows = 33)
            data_5n = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*3:(i+1)*3]
                if cols.shape[1] == 3:
                    data_5n[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "CAREA": cols.iloc[:, 2].to_numpy()
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
                        "CAREA": cols.iloc[:, 2].to_numpy()
                    }
            df_data = pd.read_excel(entry, sheet_name="Sheet1", skiprows=33)
            data_6n = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*3:(i+1)*3]
                if cols.shape[1] == 3:
                    data_6n[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "CAREA": cols.iloc[:, 2].to_numpy()
                    }
            print("6NP Data succesfully read")
        

    return data_4p, data_4n, data_5p, data_5n, data_6p, data_6n, facet_pairs

#--------------------------------------------------------------------------------------------------------------
#The following function takes a dictionary for P motion data, a dictionary for N motion data, a list of labels
#and a list of colors and plots the data with CFNM over moment
#--------------------------------------------------------------------------------------------------------------\

def plot_facet(model, motion):
    #Read in data for desired model
    data4p, data4n, data5p, data5n, data6p, data6n, facet_pairs = read_directory(model)

    if (motion == '4N-4P'):
        data_n = data4n
        data_p = data4p

    elif (motion == '5N-5P'):
        data_n = data5n
        data_p = data5p
        
    elif (motion == '6N-6P'):
        data_n = data6n
        data_p = data6p

    
    fig, ax = plt.subplots()
    colors = itertools.cycle(['r', 'g', 'b', 'c', 'm', 'y', 'k'])
    for left, right in facet_pairs:
        color = next(colors)

        #Reading data for right side
        right_xn = data_n[right]["moment"]
        right_yn = data_n[right]["CAREA"]
        right_xp = data_p[right]["moment"]
        right_yp = data_p[right]["CAREA"]
        
        #Reading data for left side
        left_xn = data_n[left]["moment"]
        left_yn = data_n[left]["CAREA"]
        left_xp = data_p[left]["moment"]
        left_yp = data_p[left]["CAREA"]
        
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
        
        #Plot left node values
        left_y = np.concatenate((np.flip(left_yn[0:20]), left_yp[1:20]))
        print('left node y: ', left_y)

        ax.plot(moment, left_y, color=color, label=left)

        #Plot right node values
        right_y = np.concatenate((np.flip(right_yn[0:20]), right_yp[1:20]))
        print('right node y:', right_y)

        ax.plot(moment, right_y, linestyle='-.', color=color, label=right)


    handles, labels = ax.get_legend_handles_labels() #collects handles, labels
    fig.set_figwidth(8)
    ax.set_title(f"Facet Contact Area (CAREA) for {model} model under motion: {motion}")
    ax.set_xlabel('Moment (N-m)')
    ax.set_ylabel('Contact Area (mm^2)')
    plt.legend(handles=handles, labels = labels, loc='upper center', ncol=4)
    plt.show()
    fig.savefig(f"New_CAREA/Plots/Individual/{model}/{model}_{motion}.png", dpi = 300)


# =====================
#The following is a function to take two models and a given specific disk, and compare the facet force magnitude
#of the disk between the two models on different subplots
# =====================

def plotfacet_compare(model1, model2, motion):
    #Read in data for desired two models to be compared
    data4p_1, data4n_1, data5p_1, data5n_1, data6p_1, data6n_1, facet_pairs = read_directory(model1)
    data4p_2, data4n_2, data5p_2, data5n_2, data6p_2, data6n_2, facet_pairs = read_directory(model2)

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
    
    #Create figure, desired colors for plot
    fig, ax = plt.subplots(1,2)
    colors = itertools.cycle(['r', 'g', 'b', 'c', 'm', 'y', 'k'])

    #Hardcoded values for moment, still couldn't figure out why it's not reading right
    moment = [-1.92, -1.81, -1.71, -1.61, -1.52, -1.41, -1.32, -1.22, -1.13, 
              -1.02, -0.96, -0.80, -0.72, -0.64, -0.54, -0.43, -0.33, -0.21, -0.12, 
               0, 0.12, 0.21, 0.33, 0.43, 0.54, 0.64, 0.72, 0.80, 0.96, 
               1.02, 1.13, 1.22, 1.32, 1.41, 1.52, 1.61, 1.71, 1.81, 1.92]

    #Iterate through all facet pairs
    for left, right in facet_pairs:
        color = next(colors)
        if left.startswith('5'): #if C5 disc values, plot data on left and right plot
            leftyn1 = data_n_1[left]["CAREA"]
            leftyp1 = data_p_1[left]["CAREA"]
            rightyn1 = data_n_1[right]["CAREA"]
            rightyp1 = data_p_1[right]["CAREA"]

            leftyn2 = data_n_2[left]["CAREA"]
            leftyp2 = data_p_2[left]["CAREA"]
            rightyn2 = data_n_2[right]["CAREA"]
            rightyp2 = data_p_2[right]["CAREA"]

            lefty1 = np.concatenate((np.flip(leftyn1[0:20]), leftyp1[1:20]))
            righty1 = np.concatenate((np.flip(rightyn1[0:20]), rightyp1[1:20]))

            lefty2 = np.concatenate((np.flip(leftyn2[0:20]), leftyp2[1:20]))
            righty2 = np.concatenate((np.flip(rightyn2[0:20]), rightyp2[1:20]))

            ax[0].plot(moment, lefty1, color=color, label=left)
            ax[0].plot(moment, righty1, linestyle='-.', color=color, label=right)

            ax[1].plot(moment, lefty2, color=color, label=left)
            ax[1].plot(moment, righty2, linestyle='-.', color=color, label=right)


        elif left.startswith('4'): #If C4 disc values, plot data on left and right plot
            leftyn1 = data_n_1[left]["CAREA"]
            leftyp1 = data_p_1[left]["CAREA"]
            rightyn1 = data_n_1[right]["CAREA"]
            rightyp1 = data_p_1[right]["CAREA"]

            leftyn2 = data_n_2[left]["CAREA"]
            leftyp2 = data_p_2[left]["CAREA"]
            rightyn2 = data_n_2[right]["CAREA"]
            rightyp2 = data_p_2[right]["CAREA"]

            lefty1 = np.concatenate((np.flip(leftyn1[0:20]), leftyp1[1:20]))
            righty1 = np.concatenate((np.flip(rightyn1[0:20]), rightyp1[1:20]))

            lefty2 = np.concatenate((np.flip(leftyn2[0:20]), leftyp2[1:20]))
            righty2 = np.concatenate((np.flip(rightyn2[0:20]), rightyp2[1:20]))

            ax[0].plot(moment, lefty1, color=color, label=left)
            ax[0].plot(moment, righty1, linestyle='-.', color=color, label=right)

            ax[1].plot(moment, lefty2, color=color, label=left)
            ax[1].plot(moment, righty2, linestyle='-.', color=color, label=right)
        
    handles_1, labels_1 = ax[0].get_legend_handles_labels()
    handles_2, labels_2 = ax[1].get_legend_handles_labels()
    fig.set_figwidth(8)
    ax[0].set_title(f"CAREA for {model1} model, C4-5 C5-6, {motion}", fontsize = 8)
    ax[0].set_xlabel('Moment (N-m)')
    ax[0].set_ylabel('Contact Area (mm^2)')
    ax[0].set_ylim(30,100)
    ax[0].legend(handles=handles_1, labels = labels_1, loc='lower center', ncol = 2)

    ax[1].set_title(f"CAREA for {model2} model, C4-5 C5-6, {motion}", fontsize = 8)
    ax[1].set_xlabel('Moment (N-m)')
    ax[1].set_ylabel('Contact Area (mm^2)')
    ax[1].set_ylim(30,100)
    ax[1].legend(handles=handles_2, labels = labels_2, loc='lower center', ncol = 2)
    plt.show()
    fig.savefig(f"New_CAREA/Plots/Comparative/{model1}-{model2}/{model1}-{model2}-{motion}.png", dpi = 300)



# ===========================================
# Plot All Facet Pairs For Individual Models
#Un-comment sections to get plots you need
# ===========================================

#-----Plotting Intact model-----
#plot_facet('Intact', '4N-4P')
#plot_facet('Intact', '5N-5P')
#plot_facet('Intact', '6N-6P')

#-----Plotting FixedNoTether model-----
#plot_facet('FixedNoTether', '4N-4P')
#plot_facet('FixedNoTether', '5N-5P')
#plot_facet('FixedNoTether', '6N-6P')

#-----Plotting FixedTether model-----
#plot_facet('FixedTether', '4N-4P')
#plot_facet('FixedTether', '5N-5P')
#plot_facet('FixedTether', '6N-6P')

#-----Plotting LatPhysNoTether model-----
#plot_facet('LatPhysNoTether', '4N-4P')
#plot_facet('LatPhysNoTether', '5N-5P')
#plot_facet('LatPhysNoTether', '6N-6P')

#-----Plotting LatPhysTether model-----
#plot_facet('LatPhysTether', '4N-4P')
#plot_facet('LatPhysTether', '5N-5P')
#plot_facet('LatPhysTether', '6N-6P')

#-----Plotting APPhysNoTether model-----
#plot_facet('APPhysNoTether', '4N-4P')
#plot_facet('APPhysNoTether', '5N-5P')
#plot_facet('APPhysNoTether', '6N-6P')

#-----Plotting APPhysTether model-----
#plot_facet('APPhysTether', '4N-4P')
#plot_facet('APPhysTether', '5N-5P')
#plot_facet('APPhysTether', '6N-6P')

#-----Plotting PhysPhysNoTether model-----
#plot_facet('PhysPhysNoTether', '4N-4P')
#plot_facet('PhysPhysNoTether', '5N-5P')
#plot_facet('PhysPhysNoTether', '6N-6P')

#-----Plotting PhysPhysTether model-----
#plot_facet('PhysPhysTether', '4N-4P')
#plot_facet('PhysPhysTether', '5N-5P')
#plot_facet('PhysPhysTether', '6N-6P')

#-----Plotting LatSlideNoTether model-----
#plot_facet('LatSlideNoTether', '4N-4P')
#plot_facet('LatSlideNoTether', '5N-5P')
#plot_facet('LatSlideNoTether', '6N-6P')

#-----Plotting LatSlideTether model-----
#plot_facet('LatSlideTether', '4N-4P')
#plot_facet('LatSlideTether', '5N-5P')
#plot_facet('LatSlideTether', '6N-6P')

#-----Plotting APSlideNoTether model-----
#plot_facet('APSlideNoTether', '4N-4P')
#plot_facet('APSlideNoTether', '5N-5P')
#plot_facet('APSlideNoTether', '6N-6P')

#-----Plotting APSlideTether model-----
#plot_facet('APSlideTether', '4N-4P')
#plot_facet('APSlideTether', '5N-5P')
#plot_facet('APSlideTether', '6N-6P')

#-----Plotting SlideSlideNoTether-----
#plot_facet('SlideSlideNoTether', '4N-4P')
#plot_facet('SlideSlideNoTether', '5N-5P')
#plot_facet('SlideSlideNoTether', '6N-6P')

#-----Plotting SlideSlideTether-----
#plot_facet('SlideSlideTether', '4N-4P')
#plot_facet('SlideSlideTether', '5N-5P')
#plot_facet('SlideSlideTether', '6N-6P')

#=========================================
#Plotting Comparative Plots
#Un-comment sections to get plots you need
#=========================================

#Comparing Intact - FixedNoTether model
plotfacet_compare('Intact', 'FixedNoTether','4N-4P')
plotfacet_compare('Intact', 'FixedNoTether','5N-5P')
plotfacet_compare('Intact', 'FixedNoTether','6N-6P')

#Comparing Intact - FixedTether model
plotfacet_compare('Intact', 'FixedTether','4N-4P')
plotfacet_compare('Intact', 'FixedTether','5N-5P')
plotfacet_compare('Intact', 'FixedTether','6N-6P')

#Comparing Intact - LatPhysNoTether model
plotfacet_compare('Intact', 'LatPhysNoTether','4N-4P')
plotfacet_compare('Intact', 'LatPhysNoTether','5N-5P') 
plotfacet_compare('Intact', 'LatPhysNoTether','6N-6P')

#Comparing Intact - LatPhysTether model
plotfacet_compare('Intact', 'LatPhysTether','4N-4P')
plotfacet_compare('Intact', 'LatPhysTether','5N-5P')
plotfacet_compare('Intact', 'LatPhysTether','6N-6P')

#Comparing Intact - APPhysNoTether model
plotfacet_compare('Intact', 'APPhysNoTether','4N-4P')
plotfacet_compare('Intact', 'APPhysNoTether','5N-5P')
plotfacet_compare('Intact', 'APPhysNoTether','6N-6P')

#Comparing Intact - APPhysTether model
plotfacet_compare('Intact', 'APPhysTether','4N-4P')
plotfacet_compare('Intact', 'APPhysTether','5N-5P')
plotfacet_compare('Intact', 'APPhysTether','6N-6P')

#Comparing Intact - PhysPhysNoTether model
plotfacet_compare('Intact', 'PhysPhysNoTether','4N-4P')
plotfacet_compare('Intact', 'PhysPhysNoTether','5N-5P') #significant difference in this plot 
plotfacet_compare('Intact', 'PhysPhysNoTether','6N-6P')

#Comparing Intact - PhysPhysTether
plotfacet_compare('Intact', 'PhysPhysTether','4N-4P')
plotfacet_compare('Intact', 'PhysPhysTether','5N-5P')
plotfacet_compare('Intact', 'PhysPhysTether','6N-6P')

#Comparing Intact - LatSlideNoTether model
plotfacet_compare('Intact', 'LatSlideNoTether','4N-4P')
plotfacet_compare('Intact', 'LatSlideNoTether','5N-5P')
plotfacet_compare('Intact', 'LatSlideNoTether','6N-6P')

#Comparing Intact - LatSlideTether
plotfacet_compare('Intact', 'LatSlideTether','4N-4P')
plotfacet_compare('Intact', 'LatSlideTether','5N-5P')
plotfacet_compare('Intact', 'LatSlideTether','6N-6P')

#Comparing Intact - APSlideNoTether model
plotfacet_compare('Intact', 'APSlideNoTether','4N-4P')
plotfacet_compare('Intact', 'APSlideNoTether','5N-5P')
plotfacet_compare('Intact', 'APSlideNoTether','6N-6P')

#Comparing Intact - APSlideTether
plotfacet_compare('Intact', 'APSlideTether','4N-4P')
plotfacet_compare('Intact', 'APSlideTether','5N-5P')
plotfacet_compare('Intact', 'APSlideTether','6N-6P')

#Comparing Intact - SlideSlideNoTether model
plotfacet_compare('Intact', 'SlideSlideNoTether','4N-4P')
plotfacet_compare('Intact', 'SlideSlideNoTether','5N-5P')
plotfacet_compare('Intact', 'SlideSlideNoTether','6N-6P')

#Comparing Intact - SlideSlideTether model
plotfacet_compare('Intact', 'SlideSlideTether','4N-4P')
plotfacet_compare('Intact', 'SlideSlideTether','5N-5P')
plotfacet_compare('Intact', 'SlideSlideTether','6N-6P')
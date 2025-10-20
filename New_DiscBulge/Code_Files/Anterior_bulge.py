import pandas as pd
from pandas import DataFrame
import csv
import numpy as np
import matplotlib.pyplot as plt
import os
from os import listdir
import tkinter as tk
from tkinter import filedialog
#Authors @chriskey, @amladow, @shadestar44

#This file is for analyzing and plotting the Disc Bulge of a given model, specifically the Anterior Bulge
#Currently accepts folder of CSV files, to be changed? Maybe


#This script reads in an existing directory rather than a single file
root = tk.Tk()
root.withdraw()  # Hide Tkinter root window
file_folder = filedialog.askdirectory(mustexist = True) #file_folder is a str variable

if not file_folder:
    raise FileNotFoundError("No Folder Selected!") #if no directory selected return error

print("Selected directory:", file_folder)


#This creates a list of .csv files that data will be extracted from and prints it
#Seems like specifically pulls out C34_4N for each model out of a directory that contains
#ALL the CSV files, but the directory in our repo has it split by M1, M2, and so forth so will change this - Anders
list_C34_4N = []
list_C56_4N = []
list_C67_4N = []
for entry in os.listdir(file_folder):
    for file in os.listdir(entry):   
        if 'C34' in file:
            if '4N' in file:
                print(file)
                list_C34_4N.append(file)
                print(list_C34_4N)
        
        if 'C56' in entry:
            if '4N' in entry:
                print(file)
                list_C56_4N.append(file)
                print(list_C56_4N)
        
        


# @author chriskey

# the function analysis takes the list of .csv files and runs an analysis
# Disc bulge is the the measure of how far the disc bulges past the anterior most portion of the upper and lower vertbra
# This can be thought of as the perpendicular distance of the most bulging part of the disc to a line that connects the anterior portions of the upper and lower vertebra
def analysis(entry,graph_title):
    
    
    bulge_stuff = pd.DataFrame()


    for i in range(len(entry)):
        
        data = pd.read_csv('/Users/chriskey/Desktop/'+entry[i])     # Remember to change this
        
        data.columns = data.columns.str.replace(' ','') 
        
        
        data = data.sort_values(by = ['NodeLabel', 'Frame'], ascending = (True, True))
        # data = data.sort_values(by='NodeLabel',by='Index')
        data[['Frame','time']] = data['Frame'].str.split('=',expand=True)
        
        
        Node1 = data.loc[data['NodeLabel']==11002]
        Node2 = data.loc[data['NodeLabel']==27979]
        Node3 = data.loc[data['NodeLabel']==33106]
        
        Node = Node1.reset_index(drop=True)
        Node1 = Node2.reset_index(drop=True)
        Node2 = Node3.reset_index(drop=True)
        
        Node['time']= Node['time'].astype(float)
        if i==0:
            bulge_stuff['Moment'] = 2 * Node['time']
            
        ycoors = Node['Y']+Node['U-U2']
        ycoors2 = Node1['Y']+Node1['U-U2']
        ycoors3 = Node2['Y']+Node2['U-U2']
        
        zcoors = Node['Z']+Node['U-U3']
        zcoors2 = Node1['Z']+Node1['U-U3']
        zcoors3 = Node2['Z']+Node2['U-U3']
        
        demon = np.sqrt(((ycoors2-ycoors)**2)+((zcoors2-zcoors)**2))
        nom = np.abs(((zcoors2-zcoors)*ycoors3)-((ycoors2-ycoors)*zcoors3)+((ycoors2*zcoors)-(zcoors2*ycoors)))
        bulge = nom/demon
        bulge_stuff[''+entry[i][+5:-7:]] = bulge
        bulge_stuff.columns = bulge_stuff.columns.str.replace('_',' ') 
        i = i+1
    
        
    bulge_stuff.plot(x = 'Moment',title = graph_title)

analysis(list_C34_4N,'C34 Level')
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import itertools
import tkinter as tk
from tkinter import filedialog
from pathlib import Path


def read_directory(model):
    #----- Get full data path -----
    data_path = Path(f'New_FacetMeanStress/Data_Files/{model}') #navigate to relative path in repository
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
            df_data = pd.read_excel(entry, sheet_name="Sheet1", skiprows=5, nrows = 20) #skip first four rows
            data_4n = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*5:(i+1)*5]
                if cols.shape[1] == 5:
                    data_4n[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "X": cols.iloc[:, 1].to_numpy(),
                        "Y": cols.iloc[:, 2].to_numpy(),
                        "Z": cols.iloc[:, 3].to_numpy()
                    }

            df_data = pd.read_excel(entry, sheet_name= "Sheet1", skiprows = 33)
            data_4p = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*5:(i+1)*5]
                if cols.shape[1] == 5:
                    data_4p[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "FCMS": cols.iloc[:, 4].to_numpy()
                    }
            print("4NP Data succesfully read")

        #Reading all data for 5 motion
        elif entry.name.startswith("5NP"):
            #------ Loading Data ------
            df_data = pd.read_excel(entry, sheet_name="Sheet1", skiprows=4, nrows = 20) #skip first four rows
            # Build dictionary
            data_5n = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*5:(i+1)*5]
                if cols.shape[1] == 5:
                    data_5n[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "FCMS": cols.iloc[:, 4].to_numpy()
                    }

            df_data = pd.read_excel(entry, sheet_name= "Sheet1", skiprows = 33)
            data_5p = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*5:(i+1)*5]
                if cols.shape[1] == 5:
                    data_5p[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "FCMS": cols.iloc[:, 4].to_numpy()
                    }
            print("5NP Data succesfully read")

        #Reading all data for 6 motion (axial rotation)
        elif entry.name.startswith("6NP"):
            df_data = pd.read_excel(entry, sheet_name="Sheet1", skiprows=4, nrows = 20) #skip first four rows
            data_6n = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*5:(i+1)*5]
                if cols.shape[1] == 5:
                    data_6n[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "FCMS": cols.iloc[:, 4].to_numpy()
                    }
            df_data = pd.read_excel(entry, sheet_name="Sheet1", skiprows=33)
            data_6p = {}
            for i, label in enumerate(facet_labels):
                cols = df_data.iloc[:, i*5:(i+1)*5]
                if cols.shape[1] == 5:
                    data_6p[label] = {
                        "time": cols.iloc[:, 0].to_numpy(),
                        "moment": cols.iloc[:, 1].to_numpy(),
                        "FCMS": cols.iloc[:, 4].to_numpy()
                    }
            print("6NP Data succesfully read")
        

    return data_4p, data_4n, data_5p, data_5n, data_6p, data_6n, facet_pairs



def normalize(v):
    return v / np.linalg.norm(v)

#Finds line distance 
def line_distance(point, a, b):
    return np.abs(np.cross(b - a, point - a) / np.linalg.norm(b - a))

#Finds intersectino between of two lines
def intersect_lines(p1, d1, p2, d2):
    A = np.array([d1, -d2]).T
    if np.linalg.matrix_rank(A) < 2:
        return None
    t, s = np.linalg.solve(A, p2 - p1)
    return p1 + t * d1

def inscribed_circle_quad(P):
    # Convert to numpy
    P0, P1, P2, P3 = P

    # Edge vectors
    v01 = normalize(P1 - P0)
    v03 = normalize(P3 - P0)
    v12 = normalize(P2 - P1)
    v10 = normalize(P0 - P1)
    v23 = normalize(P3 - P2)
    v21 = normalize(P1 - P2)
    v30 = normalize(P0 - P3)
    v32 = normalize(P2 - P3)

    # Angle bisectors at vertices
    b0 = normalize(v01 + v03)
    b1 = normalize(v12 + v10)
    b2 = normalize(v23 + v21)
    b3 = normalize(v30 + v32)

    #Find two bisector intersections → circle center
    C1 = intersect_lines(P0, b0, P1, b1)
    C2 = intersect_lines(P2, b2, P3, b3)

    if C1 is None or C2 is None:
        raise ValueError("Bisectors did not intersect.")

    # Average intersection for stability
    C = (C1 + C2) / 2.0

    # Distances to edges → radius
    r = min([
        line_distance(C, P0, P1),
        line_distance(C, P1, P2),
        line_distance(C, P2, P3),
        line_distance(C, P3, P0)
    ])

    return C, r
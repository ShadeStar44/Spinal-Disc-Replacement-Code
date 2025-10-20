#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jan 16 12:27:56 2021

@author: chriskey
"""

#need abuqus to run this code, but will be very helpful im imagining.
#will as Alyssa or Andrew to run this and see what happens

from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=113.506240844726, 
    height=157.080001831055)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from viewerModules import *
from driverUtils import executeOnCaeStartup
import odbAccess
import os


# bulge is a function that selects the nodes and type of data you want to pull in Abaqus and exports it to a .csv file
def bulge(filename,nodes,output):
    o2 = session.openOdb(name=filename)

    # code to get data from whatever file is wanted, a list of the nodes that you want data from,
    # and the output filename and path.
    session.viewports['Viewport: 1'].setValues(displayedObject=o2)
    session.viewports['Viewport: 1'].makeCurrent()
    leaf = dgo.LeafFromModelNodeLabels(nodeLabels=(('PART-1-1', nodes), ))
    dg = session.DisplayGroup(leaf=leaf, name='centroid')
    session.viewports['Viewport: 1'].odbDisplay.displayGroup.replace(leaf=leaf)
    odb = session.odbs[filename]
    session.fieldReportOptions.setValues(reportFormat=COMMA_SEPARATED_VALUES)
    session.writeFieldReport(fileName= output, append=OFF, 
                             sortItem='Node Label', odb=odb, step=0, frame=20, outputPosition=NODAL, 
                             variable=(('U', NODAL), ), stepFrame=ALL)


from os import listdir
for entry in os.listdir('C:/Users/ctkey/Desktop/Bulge'):    # This is the path to the .odb files you want to extract data from
    if entry.endswith('.odb'):
        print(entry)
        newfile = 'C:/Users/ctkey/Desktop/Bulge/'+entry[:-4]+'_Upgrade.odb'    #This will save an new .odb file with _Upgrade added to the name
        print(newfile)
        oldfile = 'C:/Users/ctkey/Desktop/Bulge/'+entry
        odbAccess.upgradeOdb(existingOdbPath=oldfile,
        upgradedOdbPath=newfile)
        os.remove('C:/Users/ctkey/Desktop/Bulge/'+entry)    # This removes the .odb file that is not upgraded
        csv = 'M:/SpHinal!/Python_Bulge/'+entry[:-4]+'_C34.csv'    # This is the filepath and name of the .csv file where the data will be written
        nodelist = ('11002','27979','33106')    # List of nodes that you want to collect data from
        bulge(newfile, nodelist ,csv)   # This calls the function and repeats for every file in the work directory on line 41
        
       
        csv = 'M:/SpHinal!/Python_Bulge/'+entry[:-4]+'_C56.csv'
        nodelist =('47997','75165','80978')
        bulge(newfile, nodelist ,csv)
    
        
        csv = 'M:/SpHinal!/Python_Bulge/'+entry[:-4]+'_C67.csv'
        nodelist = ('74745','99631','106459')
        bulge(newfile, nodelist ,csv)
        
        
        
        
        
        
        
        
        
        
        
        
        
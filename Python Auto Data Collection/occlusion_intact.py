#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jan 22 14:56:59 2021

@author: chriskey
"""

# This script updates .odb files in the desired directory path and updates 
# them to the current version of abaqus CAE... If the files have already been updated, lines 49-53 can be commented out



from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=113.506240844726, 
    height=157.080001831055)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from viewerModules import *
from driverUtils import executeOnCaeStartup
import odbAccess



def bulge(filename,nodes,output):
    o2 = session.openOdb(name=filename)

    # code to get data for the C34 disc
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
for entry in os.listdir('C:/Users/ctkey/Desktop/Intact'):
    if entry.endswith('.odb'):
        print(entry)


# The code to update .odb files is now commented out
        # newfile = 'M:/SpHinal!/Python_Bulge/M15/'+entry[:-4]+'_Upgrade.odb'
        # print(newfile)
        # oldfile = 'M:/SpHinal!/Python_Bulge/M15/'+entry
        # odbAccess.upgradeOdb(existingOdbPath=oldfile,
        # upgradedOdbPath=newfile)
        csv = 'M:/SpHinal!/Python_Bulge/Occlusion/C34/'+entry[:-4]+'_C34_occlusion.csv'
        nodelist = ('11002', '28021','12381', '29344','8826','25566','14718','31418','34090','31686','31648','21923','7024',)
        bulge('C:/Users/ctkey/Desktop/Intact/'+entry, nodelist ,csv)
        
        # The following section of code can be used to fine the occlusion of the spinal canal and foramen occlusion if needed, 
        # however only the intact model has disc at the C45 level
        # csv = 'M:/SpHinal!/Python_Bulge/M15/'+entry[:-4]+'_C45.csv'
        # nodelist =('48458', '27615', '28995', '49901','25068','45604','31322','52164','54850','42141','53831','23233','52379')
        # bulge('C:/Users/ctkey/Desktop/Bulge/'+entry, nodelist ,csv)
    
        csv = 'M:/SpHinal!/Python_Bulge/Occlusion/C56/'+entry[:-4]+'_C56_occlusion.csv'
        nodelist = ('48010', '75248','49528', '76817','45231','72178','51801','79122','81971','43603','79568','64922','79529')
        bulge('C:/Users/ctkey/Desktop/Intact/'+entry, nodelist ,csv)
        
        
        csv = 'M:/SpHinal!/Python_Bulge/Occlusion/C67/'+entry[:-4]+'_C67_occlusion.csv'
        nodelist = ('74758', '99748','76402', '101677','72185','96158','79143','104690','107452','67481','91547','106429','105011')
        bulge('C:/Users/ctkey/Desktop/Intact/'+entry, nodelist ,csv)
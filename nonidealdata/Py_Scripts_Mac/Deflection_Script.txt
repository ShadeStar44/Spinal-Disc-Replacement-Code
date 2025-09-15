import numpy as np
import csv
import sys
from odbAccess import *
from abaqusConstants import *

odbName = 'S2_4N_SlideSlide_Tether'
odb = openOdb(odbName + '.odb', readOnly = False)
annDefl=odb.steps['Load1'].frames[-1].fieldOutputs['U'].values
annDeflPre=odb.steps['Load1'].frames[0].fieldOutputs['U'].values
n = [] #anndefl is the annular deflection at the last frame of loading
for v in annDefl:
	n.append(v.nodeLabel)

Ux = []
for v in annDefl:
	Ux.append(v.data[0]) 

Uy = []
for v in annDefl:
	Uy.append(v.data[1])

Uz = []
for v in annDefl:
	Uz.append(v.data[2])

n1 = [] #annDeflPre is the annular deflection at the very beginning of loading
for v in annDeflPre:
	n1.append(v.nodeLabel)

Ux1 = []
for v in annDeflPre:
	Ux1.append(v.data[0]) 

Uy1 = []
for v in annDeflPre:
	Uy1.append(v.data[1])

Uz1 = []
for v in annDeflPre:
	Uz1.append(v.data[2])

M = [n,Ux,Uy,Uz,n1,Ux1,Uy1,Uz1]

with open(odbName + '_Deflection'+ '.csv','wb') as f:
	csv_writer = csv.writer(f, dialect='excel') #creating csv file with values
	csv_writer.writerow(['Post Load', '', '', '','Pre Load','','',''])
	csv_writer.writerow(['Node Label', 'U(x)', 'U(y)', 'U(z)','Node Label', 'U(x)', 'U(y)', 'U(z)'])
	csv_writer.writerows(np.transpose(M))




import pandas as pd
import matplotlib.pyplot as plt

# Read data from Excel file
data = pd.read_excel('4NP_facetContactArea.xls', header=None)

# Extract columns (adjusting for zero-based indexing)
moment = data.iloc[:, 1]  
C6LR = data.iloc[:, 2]
C6LL = data.iloc[:, 5]
C5LR = data.iloc[:, 8]
C5LL = data.iloc[:, 11]
C4LR = data.iloc[:, 14]
C4LL = data.iloc[:, 17]
C3LR = data.iloc[:, 20]
C3LL = data.iloc[:, 23]

# Plotting
plt.figure(3)

plt.plot(moment, C6LR, 'b', label='C6LR')  
plt.plot(moment, C6LL, 'm', label='C6LL')
plt.plot(moment, C5LR, 'g', label='C5LR')
plt.plot(moment, C5LL, 'r', label='C5LL')
plt.plot(moment, C4LR, 'c', label='C4LR')
plt.plot(moment, C4LL, color=(0.5, 0, 0.5), label='C4LL')
plt.plot(moment, C3LR, 'k', label='C3LR')
plt.plot(moment, C3LL, label='C3LL')

plt.xlim([-2, 2])
plt.xlabel('Moment (Nm)')
plt.ylabel('Area (mm^2)')
plt.title('Facet Contact Area (CAREA) for intact model under Flexion/Extension (4P/4N)')
plt.legend()

plt.show()

import numpy as np
import matplotlib.pyplot as plt

## Plotting Facet Contact Area under extenstion/flexion (4N/4P) for the upper section.
# Initialize empty arrays as in MATLAB code
c4ulxp = np.array([]) - 2
c4ulyp = np.array([])

c4urxp = np.array([]) - 2
c4uryp = np.array([])

c5ulxp = np.array([]) - 2
c5ulyp = np.array([])

c5urxp = np.array([]) - 2
c5uryp = np.array([])

c6ulxp = np.array([]) - 2
c6ulyp = np.array([])

c6urxp = np.array([]) - 2
c6uryp = np.array([])

c7ulxp = np.array([]) - 2
c7ulyp = np.array([])

c7urxp = np.array([]) - 2
c7uryp = np.array([])

c4ulxn = -1 * np.array([]) + 2
c4ulyn = np.array([])

c4urxn = -1 * np.array([]) + 2
c4uryn = np.array([])

c5ulxn = -1 * np.array([]) + 2
c5ulyn = np.array([])

c5urxn = -1 * np.array([]) + 2
c5uryn = np.array([])

c6ulxn = -1 * np.array([]) + 2
c6ulyn = np.array([])

c6urxn = -1 * np.array([]) + 2
c6uryn = np.array([])

c7ulxn = -1 * np.array([]) + 2
c7ulyn = np.array([])

c7urxn = -1 * np.array([]) + 2
c7uryn = np.array([])

plt.figure(25)

def plot_facet(left_xn, left_yp, right_xn, right_yp, left_color, right_color, label_left, label_right):
    # Flip slices from index 1 to 20 (2:21 in MATLAB, zero-based in Python means 1:21)
    # Use only if arrays have enough elements, else empty arrays
    left_xl = 2 * np.concatenate((np.flip(left_xn[1:21]), left_yp))
    left_yl = np.concatenate((np.flip(left_yp[1:21]), left_yp))
    p_left, = plt.plot(left_xl, left_yl, color=left_color, label=label_left)

    right_xr = 2 * np.concatenate((np.flip(right_xn[1:21]), right_yp))
    right_yr = np.concatenate((np.flip(right_yp[1:21]), right_yp))
    p_right, = plt.plot(right_xr, right_yr, linestyle='-.', color=right_color, label=label_right)

    return p_left, p_right

a, e = plot_facet(c4ulxn, c4ulyp, c4urxn, c4uryp, 'r', 'r', 'C4UL', 'C4UR')
b, f = plot_facet(c5ulxn, c5ulyp, c5urxn, c5uryp, 'g', 'g', 'C5UL', 'C5UR')
c, g = plot_facet(c6ulxn, c6ulyp, c6urxn, c6uryp, 'b', 'b', 'C6UL', 'C6UR')
d, h = plot_facet(c7ulxn, c7ulyp, c7urxn, c7uryp, 'c', 'c', 'C7UL', 'C7UR')

plt.title('Facet Contact Area (CAREA) for model 14 under extension/flexion (4N/4P)')
plt.xlabel('Moment (N-m)')
plt.ylabel('Area (mm^2)')
plt.legend(handles=[a,b,c,d,e,f,g,h], loc='lower center')
plt.show()

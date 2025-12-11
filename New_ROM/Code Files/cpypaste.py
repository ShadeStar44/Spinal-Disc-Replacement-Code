import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import itertools
import tkinter as tk
from tkinter import filedialog

#extension,(4N),data,converted,to,degrees
tc=np.array([2,2.05,2.1,2.15,2.2,2.25,2.30198,2.35365,2.40358,2.45421,2.50322,2.55384,2.60384,2.65565,2.70225,2.75206,2.80139,2.85108,2.90339,2.95085,3])
ur1c=np.array([0.000881437 0.0069705 0.010491 0.0132299 0.0143883 0.0167015 0.0183008 0.0197466 0.0207372 0.0210336 0.0212875 0.021241 0.0207236 0.0198262 0.0185641 0.0167416 0.0146364 0.012088 0.00989958 0.00682497 0.00410041])
ur2c=np.array([0.000881437 0.0069705 0.010491 0.0132299 0.0143883 0.0167015 0.0183008 0.0197466 0.0207372 0.0210336 0.0212875 0.021241 0.0207236 0.0198262 0.0185641 0.0167416 0.0146364 0.012088 0.00989958 0.00682497 0.00410041])
ur3c=np.array()
ur1c=ur1c*180/np.pi+ 
ur2c=ur2c*180/np.pi+ 
ur3c=ur3c*180/np.pi+ 
#flexion,(4P),data,converted,to,degrees
ur1d=np.array()
ur2d=np.array()
ur3d=np.array()
ur1d=ur1d*180/np.pi+
ur2d=ur2d*180/np.pi+
ur3d=ur3d*180/np.pi+
#lateral,bending,(5N),data,converted,to,degrees
ur1c5=np.array()
ur2c5=np.array()
ur3c5=np.array()
ur1c5=ur1c5*180/np.pi+
ur2c5=ur2c5*180/np.pi+
ur3c5=ur3c5*180/np.pi+ 
#lateral,bending,(5P),data,converted,to,degrees
ur1d5=np.array()
ur2d5=np.array()
ur3d5=np.array()
ur1d5=ur1d5*180/np.pi+
ur2d5=ur2d5*180/np.pi+
ur3d5=ur3d5*180/np.pi+
#axial,rotation,(6N),data,converted,to,degrees
ur1c6=np.array()
ur2c6=np.array()
ur3c6=np.array()
ur1c6=ur1c6*180/np.pi+
ur2c6=ur2c6*180/np.pi+
ur3c6=ur3c6*180/np.pi+
#axial,rotation,(6P),data,converted,to,degrees
ur1d6=np.array()
ur2d6=np.array()
ur3d6=np.array()
ur1d6=ur1d6*180/np.pi+
ur2d6=ur2d6*180/np.pi+
ur3d6=ur3d6*180/np.pi+
#4N & 4P
u1z= np.concatenate((np.flip(ur1c[2:21]),ur1d))
u2z= np.concatenate((np.flip(ur2c[2:21]),ur2d))
u3z=np.concatenate((np.flip(ur3c[2:21]),ur3d))
t3= np.concatenate((2*(-1*np.flip(tc[2:21])+2),(tc-2)*2))

#5N & 5P
u1z5=np.concatenate((np.flip(ur1c5[2:21]),ur1d5))
u2z5=np.concatenate((np.flip(ur2c5[2:21]),ur2d5))
u3z5=np.concatenate((np.flip(ur3c5[2:21]),ur3d5))

#6N & 6P
u1c6=np.concatenate((np.flip(ur1c6[2:21]),ur1d6))
u2c6=np.concatenate((np.flip(ur2c6[2:21]),ur2d6))
u3c6=np.concatenate((np.flip(ur3c6[2:21]),ur3d6))

plots = np.linspace(1,3,3)
print(plots)

fig, axs = plt.subplots(3, 1, figsize=(10, 13), sharex=True)

# --- Plot 1: u1z, u2z, u3z ---
axs[0].plot(t3, u1z, label='ROM X-axis')
axs[0].plot(t3, u2z, label='ROM Y-axis')
axs[0].plot(t3, u3z, label='ROM Z-axis')
axs[0].set_title('Flexion/Extension')
axs[0].set_ylabel('ROM (deg)')
axs[0].grid(True)
axs[0].legend()

# --- Plot 2: u1z5, u2z5, u3z5 ---
axs[1].plot(t3, u1z5, label='ROM X-axis')
axs[1].plot(t3, u2z5, label='ROM Y-axis')
axs[1].plot(t3, u3z5, label='ROM Z-axis')
axs[1].set_title('Lateral Bending')
axs[1].set_ylabel('ROM (deg)')
axs[1].grid(True)
axs[1].legend()

# --- Plot 3: u1z6, u2z6, u3z6 ---
axs[2].plot(t3, u1c6, label='ROM X-axis')
axs[2].plot(t3, u2c6, label='ROM Y-axis')
axs[2].plot(t3, u3c6, label='ROM Z-axis')
axs[2].set_title('Axial Rotation')
axs[2].set_xlabel('Time')
axs[2].set_ylabel('ROM (deg)')
axs[2].grid(True)
axs[2].legend()

fig.savefig(f"New_ROM/Plots/IntactROM.png", dpi = 300)
plt.tight_layout()
plt.show()
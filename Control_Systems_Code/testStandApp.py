import socket
import tkinter as tk
from tkinter import ttk, filedialog
import ast

ESP_IP = "192.168.4.1"
PORT = 1234

# ------------------------
# Networking
# ------------------------
def send_command(cmd):
    try:
        s = socket.socket()
        s.settimeout(0.3)  # VERY IMPORTANT (fast fail)
        s.connect((ESP_IP, PORT))
        s.send((cmd + "\n").encode())
        response = s.recv(4096).decode()
        s.close()
        status_label.config(text=f"{cmd} → {response}")
    except Exception as e:
        status_label.config(text=f"Offline / Error")

def get_queue():
    try:
        s = socket.socket()
        s.settimeout(0.3)  # prevents freezing
        s.connect((ESP_IP, PORT))
        s.send("get_queue\n".encode())
        response = s.recv(4096).decode()
        s.close()
        return ast.literal_eval(response)
    except:
        return None

# ------------------------
# Basic Controls
# ------------------------
def start(): send_command("start")
def stop(): send_command("stop")
def pause(): send_command("pause")
def resume(): send_command("resume")


# ------------------------
# Load Trajectory
# ------------------------
def browse_file():
    filepath = filedialog.askopenfilename()
    if filepath:
        trajectory_entry.delete(0, tk.END)
        trajectory_entry.insert(0, filepath)


def load_trajectory():
    path = trajectory_entry.get()
    if not path:
        return
    send_command(f"load_trajectory {path}")
    refresh_queue()


# ------------------------
# Move Axis
# ------------------------
def move_axis():
    axis = axis_var.get().lower()
    direction = 1 if move_direction_var.get() == "Positive" else 0

    try:
        distance = float(distance_entry.get())
    except:
        status_label.config(text="Invalid distance")
        return

    send_command(f"move_axis {axis} {direction} {distance}")


# ------------------------
# Rotate Axis (A)
# ------------------------
def rotate_axis():
    direction = 1 if rotate_direction_var.get() == "Positive" else 0

    try:
        angle = float(rotate_entry.get())
    except:
        status_label.config(text="Invalid angle")
        return

    send_command(f"move_axis a {direction} {angle}")

# ------------------------
# Loop Control
# ------------------------
def set_loop_count():
    try:
        count = int(loop_entry.get())
    except:
        status_label.config(text="Invalid loop count")
        return

    send_command(f"set_loop_count {count}")


# ------------------------
# Queue Manager
# ------------------------
def refresh_queue():
    data = get_queue()
    if not data:
        return

    queue_listbox.delete(0, tk.END)

    for i, name in enumerate(data["queue"]):
        label = f"{i}: {name.split('/')[-1]}"
        if i == data["current_traj"]:
            label += "  <-- ACTIVE"
        queue_listbox.insert(tk.END, label)


def remove_selected():
    sel = queue_listbox.curselection()
    if sel:
        send_command(f"remove_traj {sel[0]}")
        refresh_queue()


def move_up():
    sel = queue_listbox.curselection()
    if sel and sel[0] > 0:
        send_command(f"move_traj {sel[0]} {sel[0]-1}")
        refresh_queue()


def move_down():
    sel = queue_listbox.curselection()
    if sel:
        send_command(f"move_traj {sel[0]} {sel[0]+1}")
        refresh_queue()


# ------------------------
# GUI Layout
# ------------------------
root = tk.Tk()
root.title("ESP32 Motion Controller")
root.geometry("500x650")

# -------- Controls --------
frame_controls = tk.LabelFrame(root, text="Controls")
frame_controls.pack(fill="x", padx=10, pady=5)

tk.Button(frame_controls, text="Start", width=10, command=start)\
    .grid(row=0, column=0, padx=5, pady=5)
tk.Button(frame_controls, text="Stop", width=10, command=stop)\
    .grid(row=0, column=1, padx=5)
tk.Button(frame_controls, text="Pause", width=10, command=pause)\
    .grid(row=1, column=0, padx=5)
tk.Button(frame_controls, text="Resume", width=10, command=resume)\
    .grid(row=1, column=1, padx=5)

# -------- Loop Control --------
frame_loop = tk.LabelFrame(root, text="Loop Count")
frame_loop.pack(fill="x", padx=10, pady=5)

loop_entry = tk.Entry(frame_loop)
loop_entry.insert(0, "1")
loop_entry.grid(row=0, column=0, padx=5)

tk.Button(frame_loop, text="Set", command=set_loop_count)\
    .grid(row=0, column=1, padx=5)

# -------- Move Axis --------
frame_move = tk.LabelFrame(root, text="Move Axis")
frame_move.pack(fill="x", padx=10, pady=5)
axis_var = tk.StringVar(value="x")
axis_menu = ttk.Combobox(frame_move, textvariable=axis_var, values=("x","y","a"), width=5)
axis_menu.grid(row=0, column=1)

move_direction_var = tk.StringVar(value="Positive")
direction_menu = ttk.Combobox(frame_move, textvariable=move_direction_var,
                              values=("Positive","Negative"), width=8)
direction_menu.grid(row=0, column=3)

distance_entry = tk.Entry(frame_move, width=8)
distance_entry.insert(0, "1.0")
distance_entry.grid(row=1, column=1)

tk.Button(frame_move, text="Move", command=move_axis)\
    .grid(row=1, column=2, columnspan=2, padx=5)

tk.Label(frame_move, text="Axis").grid(row=0, column=0)
tk.Label(frame_move, text="Dir").grid(row=0, column=2)
tk.Label(frame_move, text="Dist").grid(row=1, column=0)

# -------- Rotate Axis --------
frame_rotate = tk.LabelFrame(root, text="Rotate Axis (A)")
frame_rotate.pack(fill="x", padx=10, pady=5)

rotate_direction_var = tk.StringVar(value="Positive")
rotate_direction_menu = ttk.Combobox(frame_rotate,
                                     textvariable=rotate_direction_var,
                                     values=("Positive","Negative"),
                                     width=8)
rotate_direction_menu.grid(row=0, column=1)

rotate_entry = tk.Entry(frame_rotate, width=8)
rotate_entry.insert(0, "90")
rotate_entry.grid(row=1, column=1)

tk.Button(frame_rotate, text="Rotate", command=rotate_axis)\
    .grid(row=0, column=2, rowspan=2, padx=5)

tk.Label(frame_rotate, text="Dir").grid(row=0, column=0)
tk.Label(frame_rotate, text="Deg").grid(row=1, column=0)

# -------- Trajectory Load --------
frame_traj = tk.LabelFrame(root, text="Load Trajectory")
frame_traj.pack(fill="x", padx=10, pady=5)

trajectory_entry = tk.Entry(frame_traj)
trajectory_entry.grid(row=0, column=0, columnspan=2, sticky="ew", padx=5)

tk.Button(frame_traj, text="Browse", command=browse_file)\
    .grid(row=1, column=0, padx=5, pady=5)
tk.Button(frame_traj, text="Load", command=load_trajectory)\
    .grid(row=1, column=1, padx=5)

frame_traj.columnconfigure(0, weight=1)
frame_traj.columnconfigure(1, weight=1)

# -------- Queue Manager --------
frame_queue = tk.LabelFrame(root, text="Trajectory Queue")
frame_queue.pack(fill="both", expand=True, padx=10, pady=5)

queue_listbox = tk.Listbox(frame_queue)
queue_listbox.pack(fill="both", expand=True)

control_frame = tk.Frame(frame_queue)
control_frame.pack(fill="x")

tk.Button(control_frame, text="Refresh", width=8, command=refresh_queue)\
    .grid(row=0, column=0, padx=3, pady=3)
tk.Button(control_frame, text="Remove", width=8, command=remove_selected)\
    .grid(row=0, column=1, padx=3)
tk.Button(control_frame, text="Up", width=6, command=move_up)\
    .grid(row=0, column=2, padx=3)
tk.Button(control_frame, text="Down", width=6, command=move_down)\
    .grid(row=0, column=3, padx=3)
tk.Button(control_frame, text="Clear", width=8,
          command=lambda: send_command("clear_trajectories"))\
    .grid(row=0, column=4, padx=3)

# -------- Status --------
status_label = tk.Label(root, text="Ready", wraplength=400)
status_label.pack(pady=5)

# -------- Auto Refresh --------
def auto_refresh():
    data = get_queue()

    if data:
        refresh_queue()

    root.after(2000, auto_refresh)

auto_refresh()

root.mainloop()
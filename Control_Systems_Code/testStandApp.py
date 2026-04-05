import socket
import tkinter as tk
from tkinter import ttk, filedialog

ESP_IP = "192.168.1.139"   # You may need to change this to match your ESP32's IP address
PORT = 1234


# ------------------------
# Networking
# ------------------------
def send_command(cmd):
    try:
        s = socket.socket()
        s.connect((ESP_IP, PORT))
        s.send((cmd + "\n").encode())
        response = s.recv(1024).decode()
        s.close()
        status_label.config(text=f"Sent: {cmd} | Resp: {response}")
    except Exception as e:
        status_label.config(text=f"Error: {e}")


# ------------------------
# Basic Controls
# ------------------------
def start():
    send_command("start")

def stop():
    send_command("stop")

def pause():
    send_command("pause")

def resume():
    send_command("resume")


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
        status_label.config(text="No file selected")
        return

    cmd = f"load_trajectory {path}"
    send_command(cmd)


# ------------------------
# Move Axis
# ------------------------
def move_axis():
    axis = axis_var.get().lower()
    direction = 1 if direction_var.get() == "Positive" else 0

    try:
        distance = float(distance_entry.get())
    except:
        status_label.config(text="Invalid distance")
        return

    if distance < 0.1 or distance > 85:
        status_label.config(text="Distance must be 0.1–85 mm")
        return

    cmd = f"move_axis {axis} {direction} {distance}"
    send_command(cmd)


# ------------------------
# PWM Control
# ------------------------
def set_pwm():
    pwm_name = pwm_var.get()

    try:
        value = float(pwm_entry.get())
    except:
        status_label.config(text="Invalid PWM value")
        return

    if value < 0 or value > 1:
        status_label.config(text="PWM must be 0.0–1.0")
        return

    cmd = f"set_pwm {pwm_name} {value}"
    send_command(cmd)


# ------------------------
# GUI Layout
# ------------------------
root = tk.Tk()
root.title("ESP32 Motion Controller")
root.geometry("450x550")


# --- Main Controls ---
frame_controls = tk.LabelFrame(root, text="Main Controls")
frame_controls.pack(fill="x", padx=10, pady=10)

tk.Button(frame_controls, text="Start", command=start).pack(fill="x")
tk.Button(frame_controls, text="Stop", command=stop).pack(fill="x")
tk.Button(frame_controls, text="Pause", command=pause).pack(fill="x")
tk.Button(frame_controls, text="Resume", command=resume).pack(fill="x")


# --- Load Trajectory ---
frame_traj = tk.LabelFrame(root, text="Load Trajectory")
frame_traj.pack(fill="x", padx=10, pady=10)

trajectory_entry = tk.Entry(frame_traj)
trajectory_entry.pack(fill="x", padx=5, pady=5)

tk.Button(frame_traj, text="Browse", command=browse_file).pack(fill="x")
tk.Button(frame_traj, text="Load", command=load_trajectory).pack(fill="x")


# --- Move Axis ---
frame_move = tk.LabelFrame(root, text="Move Axis")
frame_move.pack(fill="x", padx=10, pady=10)

tk.Label(frame_move, text="Axis").pack()
axis_var = tk.StringVar(value="x")
axis_menu = ttk.Combobox(frame_move, textvariable=axis_var, state="readonly")
axis_menu['values'] = ("x", "y", "a")
axis_menu.pack()

tk.Label(frame_move, text="Direction").pack()
direction_var = tk.StringVar(value="Positive")
direction_menu = ttk.Combobox(frame_move, textvariable=direction_var, state="readonly")
direction_menu['values'] = ("Positive", "Negative")
direction_menu.pack()

tk.Label(frame_move, text="Distance (mm)").pack()
distance_entry = tk.Entry(frame_move)
distance_entry.insert(0, "1.0")
distance_entry.pack()

tk.Button(frame_move, text="Move", command=move_axis).pack(pady=5)


# --- PWM Control ---
frame_pwm = tk.LabelFrame(root, text="PWM Control")
frame_pwm.pack(fill="x", padx=10, pady=10)

tk.Label(frame_pwm, text="PWM Channel").pack()
pwm_var = tk.StringVar(value="x_pwm")
pwm_menu = ttk.Combobox(frame_pwm, textvariable=pwm_var, state="readonly")
pwm_menu['values'] = ("x_pwm", "y_pwm", "a_pwm")
pwm_menu.pack()

tk.Label(frame_pwm, text="Value (0.0 - 1.0)").pack()
pwm_entry = tk.Entry(frame_pwm)
pwm_entry.insert(0, "0.5")
pwm_entry.pack()

tk.Button(frame_pwm, text="Set PWM", command=set_pwm).pack(pady=5)


# --- Status ---
status_label = tk.Label(root, text="Status: Ready", wraplength=400)
status_label.pack(pady=10)


root.mainloop()
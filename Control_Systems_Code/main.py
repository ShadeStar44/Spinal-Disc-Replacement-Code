import time
import controlCode as controlCode_PCB
from machine import Pin, PWM
import socket
import builtins

# -------- INITIALIZE SYSTEM (NEW) --------
try:
    controlCode_PCB.init_imu(controlCode_PCB.IMU1_ADDR)
    controlCode_PCB.init_imu(controlCode_PCB.IMU2_ADDR)
    controlCode_PCB.init_log()
    print("IMU + Logging initialized")
except Exception as e:
    print("Init error:", e)

# Start control loop in background (REQUIRED now)
#controlCode_PCB.background_loop()


# -------- REPL COMMAND EXPOSURE --------
builtins.start = controlCode_PCB.start
builtins.stop = controlCode_PCB.stop
builtins.pause = controlCode_PCB.pause
builtins.resume = controlCode_PCB.resume
builtins.move_axis = controlCode_PCB.move_axis
#builtins.background_loop = controlCode_PCB.background_loop
builtins.load_trajectory = controlCode_PCB.load_trajectory
builtins.set_pwm = controlCode_PCB.set_pwm

print("System ready")


# -------- COMMAND HANDLER --------
def handle_command(cmd):
    try:
        parts = cmd.strip().split()

        if not parts:
            return "EMPTY"

        name = parts[0]

        if name == "start":
            controlCode_PCB.start()

        elif name == "stop":
            controlCode_PCB.stop()
            # 🔥 ensure logs are written
            controlCode_PCB.flush_log()

        elif name == "pause":
            controlCode_PCB.pause()

        elif name == "resume":
            controlCode_PCB.resume()

        elif name == "move_axis":
            axis = parts[1]
            direction = int(parts[2])
            distance = float(parts[3])
            controlCode_PCB.move_axis(axis, direction, distance)

        elif name == "load_trajectory":
            path = " ".join(parts[1:])
            controlCode_PCB.load_trajectory(path)

        elif name == "set_pwm":
            pwm_name = parts[1]
            value = float(parts[2])
            controlCode_PCB.set_pwm(pwm_name, value)
        elif name == "clear_trajectories":
            controlCode_PCB.clear_trajectories()

        elif name == "set_loop":
            val = int(parts[1])  # 0 or 1
            controlCode_PCB.set_loop(val)
        elif name == "set_loop_count":
            count = int(parts[1])
            controlCode_PCB.set_loop_count(count)

        elif name == "get_queue":
            return str(controlCode_PCB.get_queue_status())
        elif name == "remove_traj":
            idx = int(parts[1])
            controlCode_PCB.remove_trajectory(idx)

        elif name == "move_traj":
            old = int(parts[1])
            new = int(parts[2])
            controlCode_PCB.move_trajectory(old, new)
        # -------- DEBUG / STATUS --------
        elif name == "status":
            return str({
                "running": controlCode_PCB.run_state["running"],
                "paused": controlCode_PCB.run_state["paused"],
                "step": controlCode_PCB.run_state["current_step"]
            })
        else:
            return "UNKNOWN"

        return "OK"

    except Exception as e:
        return "ERR: " + str(e)


# Start control loop in background thread
#controlCode_PCB.background_loop()

   # -------- SOCKET SERVER --------
s = socket.socket()
s.bind(('0.0.0.0', 1234))
s.listen(1)

print("Command server running on port 1234")

while True:
    conn, addr = s.accept()
    print("Client connected:", addr)

    try:
        data = conn.recv(1024).decode().strip()
        print("Received:", data)

        response = handle_command(data)
        conn.send((response + "\n").encode())

    except Exception as e:
        print("Connection error:", e)

    finally:
        conn.close() 

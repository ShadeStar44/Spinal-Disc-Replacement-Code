import time
import controlCode
from machine import Pin, PWM
import socket
#--------- Local/Serial Command setup -------------#
# expose controlCode to REPL
import builtins
builtins.start = controlCode.start
builtins.stop = controlCode.stop
builtins.pause = controlCode.pause
builtins.resume = controlCode.resume
builtins.move_axis = controlCode.move_axis
builtins.background_loop = controlCode.background_loop
builtins.load_trajectory = controlCode.load_trajectory
builtins.set_pwm = controlCode.set_pwm

print("System ready")



#-------------- Web/Remote Command handler ------------------#
def handle_command(cmd):
    try:
        parts = cmd.strip().split()

        if not parts:
            return "EMPTY"

        name = parts[0]

        if name == "start":
            controlCode.start()
        elif name == "stop":
            controlCode.stop()
        elif name == "pause":
            controlCode.pause()
        elif name == "resume":
            controlCode.resume()
        elif name == "move_axis":
            axis = parts[1]            # "x", "y", "a"
            direction = int(parts[2])  # 1 or 0
            distance = float(parts[3]) # mm
            controlCode.move_axis(axis, direction, distance)
        elif name == "load_trajectory":
            path = " ".join(parts[1:])  # handles spaces in path
            controlCode.load_trajectory(path)
        elif name == "set_pwm":
            pwm_name = parts[1]
            value = float(parts[2])
            controlCode.set_pwm(pwm_name, value)
        else:
            return "UNKNOWN"

        return "OK"

    except Exception as e:
        return "ERR: " + str(e)


# Start socket server
s = socket.socket()
s.bind(('0.0.0.0', 1234))
s.listen(1)

print("Command server running on port 1234")

while True:
    conn, addr = s.accept()
    print("Client connected:", addr)

    try:
        data = conn.recv(1024).decode()
        print("Received:", data)

        response = handle_command(data)
        conn.send(response.encode())

    except Exception as e:
        print("Connection error:", e)

    conn.close()

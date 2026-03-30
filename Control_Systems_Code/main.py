import time
import controller

# expose controller to REPL
import builtins
builtins.start = controller.start
builtins.stop = controller.stop
builtins.pause = controller.pause
builtins.resume = controller.resume
builtins.jog_x = controller.jog_x
builtins.jog_y = controller.jog_y
builtins.jog_z = controller.jog_z

print("System ready")

while True:
    controller.run()
    time.sleep(0.01)
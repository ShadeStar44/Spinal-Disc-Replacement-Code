import time
import controlCode

# expose controlCode to REPL
import builtins
builtins.start = controlCode.start
builtins.stop = controlCode.stop
builtins.pause = controlCode.pause
builtins.resume = controlCode.resume
builtins.move_axis = controlCode.move_axis
builtins.background_loop = controlCode.background_loop
builtins.load_trajectory = controlCode.load_trajectory


print("System ready")

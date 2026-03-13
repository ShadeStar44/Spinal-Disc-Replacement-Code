# This file is executed on every boot (including wake-boot from deepsleep)
import webrepl
webrepl.start()
import time
import controller

run_program = False

def start():
    global run_program
    run_program = True

def stop():
    global run_program
    run_program = False

while True:
    
    if run_program:
        controller.run()
    
    time.sleep(0.2)
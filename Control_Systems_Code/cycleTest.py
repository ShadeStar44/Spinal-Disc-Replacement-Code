from machine import Pin, PWM
import time

# ---------------- CONFIG ----------------
PWM_PIN = 14        # change to your pin (e.g., D14)
PWM_FREQ = 1000     # 1 kHz (good for your converter)

# ---------------- SETUP ----------------
pwm = PWM(Pin(PWM_PIN))
pwm.freq(PWM_FREQ)

# 50% duty cycle
pwm.duty_u16(32768)   # 50% of 65535

print("PWM running at 50% duty cycle on pin", PWM_PIN)

# ---------------- LOOP ----------------
while True:
    time.sleep(1)  # keep running
import network
import time
import webrepl

# ------------------------
# Configure Access Point
# ------------------------
SSID = "TestStandControl"
PASSWORD = "esp32control"   # Must be at least 8 characters and there are protocols in the ESP32 CHIP that automatcily deny weak passwords

ap = network.WLAN(network.AP_IF)
ap.active(True)

# Configure AP settings
ap.config(essid=SSID, password=PASSWORD, authmode=network.AUTH_WPA_WPA2_PSK)

# Optional: set a fixed IP (default is usually 192.168.4.1)
ap.ifconfig(('192.168.4.1', '255.255.255.0', '192.168.4.1', '192.168.4.1'))

# Wait for AP to be ready
time.sleep(1)

print("Access Point Active:", ap.active())
print("SSID:", SSID)
print("IP Address:", ap.ifconfig()[0])

# ------------------------
# Start WebREPL (optional)
# ------------------------
try:
    webrepl.start()
    print("WebREPL started")
except Exception as e:
    print("WebREPL error:", e)

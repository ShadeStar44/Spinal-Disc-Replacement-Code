import network
import time
import webrepl

sta = network.WLAN(network.STA_IF)
sta.active(True)

if not sta.isconnected():
    sta.connect("WIFD SSID", "PASSWORD") # Enter the network name and Password here, note you only have to change this is you change networks

    for _ in range(20):
        if sta.isconnected():
            break
        time.sleep(0.5)

print("WiFi OK:", sta.isconnected())

if sta.isconnected():
    print("IP:", sta.ifconfig()[0])

# Optional: keep for debugging
webrepl.start()
import webrepl

try:
    import network
    import time

    sta = network.WLAN(network.STA_IF)
    sta.active(True)

    if not sta.isconnected():
        sta.connect("SSID", "PASSWORD")

        for _ in range(10):
            if sta.isconnected():
                break
            time.sleep(0.5)

    print("WiFi OK:", sta.isconnected())
    if sta.isconnected():
        print("IP:", sta.ifconfig()[0])

except Exception as e:
    print("Boot error:", e)

webrepl.start()
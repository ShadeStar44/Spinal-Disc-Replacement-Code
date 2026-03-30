import json
config = {
    "ssid": "CN-926Main",
    "password": "WylieRemiD1ce"
}

with open("wifi.json", "w") as f:
    json.dump(config, f)
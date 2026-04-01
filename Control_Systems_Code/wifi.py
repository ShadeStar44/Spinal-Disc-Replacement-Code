import json
config = {
    "ssid": "Guest",
    "password": ""
}

with open("wifi.json", "w") as f:
    json.dump(config, f)
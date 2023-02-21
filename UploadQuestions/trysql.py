import json
with open("textbook-v1.0-1.json") as json_data:
    d =json.load(json_data)
    print(d)
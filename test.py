import requests

# Base url and port number
base = "http://127.0.0.1:5000/"

#Define test post request
response = requests.post(base + "products/1", json={"name": "Hand Sanitizer", "Ingredients": ["ethyl alcohol", "isopropyl alcohol", "water", "dimethyl siloxane", "copper gluconate"]})
print(response.json())

# Define test get request
response = requests.get(base + "products/1")
print(response.json())
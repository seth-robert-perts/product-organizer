import requests

# Base url and port number
base = "http://127.0.0.1:5000/"
testId = 0
    
def testPrint(json):
    global testId
    testId += 1
    return "Test " + str(testId) + ": " + str(json) + '\n'

# Test post request
response = requests.post(base + "products/1", json={"name": "Hand Sanitizer", "Ingredients": ["ethyl alcohol", "isopropyl alcohol", "water", "dimethyl siloxane", "copper gluconate"]})
print(testPrint(response.json()))

# Test get request
response = requests.get(base + "products/1")
print(testPrint(response.json()))

# Test aborted request
response = requests.get(base + "products/7777")
print(testPrint(response.json()))

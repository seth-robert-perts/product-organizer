import requests

# Base url and port number
base = "http://127.0.0.1:5000/"
testId = 0
    
def testPrint(json):
    global testId
    testId += 1
    return f"Test {str(testId)}: {json}\n"

# Test get request
response = requests.get(base + "get")
print(testPrint(str(response) + str(response.json())))

# Test post request
response = requests.post(base + "post",
                        json={
                            "name": "Hand Sanitizer",
                            "ingredients": "ethyl alcohol, isopropyl alcohol, water, dimethyl siloxane, copper gluconate"
                        })
print(testPrint(str(response) + str(response.json())))

# Test post request
response = requests.post(base + "post",
                        json={
                            "name": "Banana Bread",
                            "ingredients": "bread, banana"
                        })
print(testPrint(str(response) + str(response.json())))

# Test post request
# response = requests.post(base + "post",
                       # json={
                           # "name": "Pizza",
                           # "ingredients": "flour, water, tomato, cheese, oregano"
                       # })
# print(testPrint(str(response) + str(response.json())))
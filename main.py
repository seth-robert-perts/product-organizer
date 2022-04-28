from flask import Flask
from flask_restful import Api, Resource, reqparse, abort

# Create api using Flask framework
app = Flask(__name__)
api = Api(app)

# Define arguments for post request and utilize request parser to enforce from frontend
productPostArgs = reqparse.RequestParser()
productPostArgs.add_argument("name",        type=str, help="Name of product is required",     required=True)
productPostArgs.add_argument("Ingredients", type=str, help="List of ingredients is required", required=True, action='append')

products = {}

# Abort if product id isn't found
def abortIfProductIdNotFound(productId):
    if productId not in products:
        abort(404, message="Product not found!")

# Create Product api to define REST api responses
class Product(Resource):
    def get(self, productId):
        abortIfProductIdNotFound(productId)
        return products[productId], 200
    
    def post(self, productId):
        args = productPostArgs.parse_args()
        products[productId] = args
        return products[productId], 201 # Return the created product with a "created" status code

# Add the product resource and capture an id for further use
api.add_resource(Product, "/products/<int:productId>")

# Run the app in debug to enable auto restart
if __name__ == "__main__":
    app.run(debug=True)

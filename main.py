from flask import Flask
from flask_restful import Api, Resource, reqparse, abort, fields, marshal_with
from flask_sqlalchemy import SQLAlchemy

# Create api using Flask framework with Alchemy database
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'
api = Api(app)
db = SQLAlchemy(app)

# Create database model to define data
class ProductModel(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(100), nullable=False)
    ingredients = db.Column(db.String(1000), nullable=False)
    
    def __repr__(self):
        return f"Product(id = {id}, name = {name}, ingredients = {ingredients})"

# Initialize database
# NOTE: Only apply this once otherwise this will overwrite previous database file        
#db.create_all()

# Define serializable interface to make the database model that can be returned as json
resource_fields = {
    'id': fields.Integer,
    'name': fields.String,
    'ingredients': fields.String
}

# Define arguments for post request and utilize request parser to enforce from frontend
productPostArgs = reqparse.RequestParser()
productPostArgs.add_argument("name",        type=str, help="Name of product is required",     required=True)
productPostArgs.add_argument("ingredients", type=str, help="String of ingredients is required", required=True)

# Create Product api to define REST api responses
class Product(Resource):
    @marshal_with(resource_fields)
    def get(self, productId):
        product = ProductModel.query.filter_by(id=productId).first()
        
        # If the database could not find a product
        if not product:
            abort(404, message="Product could not be found")
            
        # Return result on success
        return product, 200
    
    @marshal_with(resource_fields)
    def post(self, productId):
        args = productPostArgs.parse_args()
        print(f"args: {args}")
        print(f"args.ingredients: {args['ingredients']}")
        
        # Check if prouct already exists in database
        existingProduct = ProductModel.query.filter_by(id=productId).first()
        
        # If the product is found then update
        if existingProduct:
            if "name" in args:
                existingProduct.name = args['name']
            if "ingredients" in args:
                existingProduct.ingredients = args['ingredients']
        
            # Commit update to database
            db.session.commit()
            
            # Return the updated product with custom status code
            return existingProduct, 210
            
        # Otherwise, create new product
        else:
            # Create a product based on POST request
            newProduct = ProductModel(id=productId, name=args['name'], ingredients=args['ingredients'])
            
            # Create product in database and save
            db.session.add(newProduct)
            db.session.commit()
            
            # Return the created product with a "created" status code
            return newProduct, 201

# Add the product resource and capture an id for further use
api.add_resource(Product, "/products/<int:productId>")

# Run the app in debug to enable auto restart
if __name__ == "__main__":
    app.run(debug=True)

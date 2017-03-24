# Shopping Cart API

Simple Rails shopping cart system assuming one user.

# Instructions

1. In main directory, run bundle install.
2. Start postgresql server.
3. In terminal, start local server with rails s command.
4. Test API.

# Testing API

Testing can be done with [curl](https://curl.haxx.se/) in the terminal. For easier testing, CSRF protection is disabled in application_controller.rb.

### Examples

##### View All Products
curl http://localhost:3000/api/products/

##### View Cart
curl http://localhost:3000/api/shopping_cart


##### Add Item to Cart
Change product_id and/or quantity

curl -H "Content-Type: application/json" -d '{"shopping_cart_item": {"product_id": 9, "quantity": 2}}' http://localhost:3000/api/order_items

##### Update Item Quantity in Cart
Change quantity and item primary key at end of URL (correct IDs can be seen when viewing cart).

curl -X PATCH -H "Content-Type: application/json" -d '{"shopping_cart_item": {"quantity": 4}}' http://localhost:3000/api/order_items/1

##### Delete Item from Cart
Change item primary key at end of URL (correct IDs can be seen when viewing cart).

curl -X DELETE http://localhost:3000/api/order_items/1

##### Purchase
curl -X PATCH -H "Content-Type: application/json" -d '{"shopping_cart": {"status": "complete"}}' http://localhost:3000/api/shopping_cart/

##### Empty Shopping Cart
curl -X DELETE http://localhost:3000/api/shopping_cart/

##### View Completed Orders
curl http://localhost:3000/api/orders

##### View Completed Order Detail
Change order primary key at end of URL (correct IDs can be seen when viewing orders)

curl http://localhost:3000/api/orders/1

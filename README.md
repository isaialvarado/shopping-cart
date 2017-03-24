View All Products
curl http://localhost:3000/api/products/

View Only One Product
curl http://localhost:3000/api/products/3

View Cart
curl http://localhost:3000/api/shopping_cart

Add Item to Cart
curl -H "Content-Type: application/json" -d '{"shopping_cart_item": {"product_id": 9, "quantity": 2}}' http://localhost:3000/api/order_items

Update Item quantity in Cart
curl -X PATCH -H "Content-Type: application/json" -d '{"shopping_cart_item": {"quantity": 4}}' http://localhost:3000/api/order_items/1

Delete Item from Cart
curl -X "DELETE" http://localhost:3000/api/order_items/1

Purchase
curl -X PATCH -H "Content-Type: application/json" -d '{"shopping_cart": {"status": "complete"}}' http://localhost:3000/api/shopping_cart/

Empty Shopping Cart
curl -X DELETE http://localhost:3000/api/shopping_cart/

ORDERS Index
curl http://localhost:3000/api/orders

ORDERS Show
curl http://localhost:3000/api/orders/1

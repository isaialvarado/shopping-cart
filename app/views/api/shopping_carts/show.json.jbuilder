json.(shopping_cart, :subtotal, :tax, :shipping, :total)
json.items shopping_cart.items do |item|
  product = item.product

  json.(item, :id, :quantity, :product_id)
  json.title product.title
  json.price product.price
end

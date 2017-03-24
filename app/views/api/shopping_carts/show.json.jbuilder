json.(shopping_cart, :subtotal, :tax, :shipping, :total)
json.items shopping_cart.items do |item|
  json.(item, :id, :unit_price, :quantity, :product_id)
  json.title item.product.title
end

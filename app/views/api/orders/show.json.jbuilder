json.(@order, :id, :subtotal, :tax, :shipping, :total)
json.items @order.items do |item|
  product = item.product

  json.(item, :id, :quantity, :product_id)
  json.title product.title
  json.price product.price
end

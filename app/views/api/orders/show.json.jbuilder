json.(@order, :id, :subtotal, :tax, :shipping, :total)
json.items @order.items do |item|
  json.(item, :id, :unit_price, :quantity, :product_id)
  json.title item.product.title
end

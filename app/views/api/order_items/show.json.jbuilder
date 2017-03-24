json.(@item, :id, :quantity, :product_id)
product = @item.product
json.title product.title
json.price product.price

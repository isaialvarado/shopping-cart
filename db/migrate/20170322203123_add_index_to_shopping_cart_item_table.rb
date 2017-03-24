class AddIndexToShoppingCartItemTable < ActiveRecord::Migration
  def change
    add_index :shopping_cart_items, :product_id
    add_index :shopping_cart_items, :shopping_cart_id
  end
end

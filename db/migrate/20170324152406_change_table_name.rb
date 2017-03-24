class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :shopping_carts, :orders
    rename_table :shopping_cart_items, :order_items
    rename_column :order_items, :shopping_cart_id, :order_id
  end
end

class CreateShoppingCartItems < ActiveRecord::Migration
  def change
    create_table :shopping_cart_items do |t|
      t.integer :quantity, null: false
      t.integer :shopping_cart_id, null: false
      t.integer :product_id, null: false
      t.timestamps null: false
    end
  end
end

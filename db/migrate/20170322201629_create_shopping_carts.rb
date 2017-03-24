class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.decimal :subtotal, null: false
      t.decimal :tax, null: false
      t.decimal :shipping, null: false
      t.decimal :total, null: false
      t.string :status, null: false
      t.timestamps null: false
    end
  end
end

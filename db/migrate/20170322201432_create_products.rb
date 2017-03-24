class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :price, null: false
      t.string :title, null: false
      t.integer :available_inventory, null: false
      t.timestamps null: false
    end
  end
end

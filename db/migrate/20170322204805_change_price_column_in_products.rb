class ChangePriceColumnInProducts < ActiveRecord::Migration
  def change
    change_column :products, :price, :decimal, precision: 5, scale: 2
    change_column :products, :title, :string, limit: 255
  end
end

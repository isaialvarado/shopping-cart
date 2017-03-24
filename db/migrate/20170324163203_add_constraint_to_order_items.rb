class AddConstraintToOrderItems < ActiveRecord::Migration
  def change
    change_column :order_items, :unit_price, :decimal, null: false
  end
end

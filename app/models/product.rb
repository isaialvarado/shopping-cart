class Product < ActiveRecord::Base
  validates :price, :title, :available_inventory, presence: true
  validates :price, format: { with: /\A\d+(\.\d{1,2})?\z/ }
  validates :price, :available_inventory,
            numericality: { greater_than_or_equal_to: 0 }
  validates :title, length: { maximum: 255 }

  has_many :shopping_cart_items
end

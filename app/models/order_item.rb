class OrderItem < ActiveRecord::Base
  validates :quantity, :unit_price, :order, :product, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :unit_price, format: { with: /\A\d+(\.\d{1,2})?\z/ }

  belongs_to :product
  belongs_to :order
end

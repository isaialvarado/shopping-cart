class OrderItem < ActiveRecord::Base
  validates :quantity, :order, :product, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :product
  belongs_to :order
end

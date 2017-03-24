class Order < ActiveRecord::Base
  validates :subtotal, :tax, :shipping, :total,
            presence: true,
            format: { with: /\A\d+(\.\d{1,2})?\z/ },
            numericality: { greater_than_or_equal_to: 0 }
  validates :status,
            presence: true,
            inclusion: { in: ["pending", "complete"] }

  has_many :items,
    foreign_key: :order_id,
    class_name: :OrderItem,
    dependent: :destroy

  def self.shopping_cart!
    Order.create(
      { subtotal: 0, tax: 1, shipping: 0, total: 0, status: "pending" }
    )
  end

  def self.process_order(shopping_cart)
    Order.transaction do
      shopping_cart.items.each do |item|
        product = item.product
        product.available_inventory -= item.quantity
        product.save!
      end

      shopping_cart.status = "complete"
      shopping_cart.save!
      "Order complete"
    end

  rescue => e
    e.message
  end

  def include?(id)
    items.pluck(:product_id).include?(id)
  end

  def update_totals!
    self.subtotal = calculate_subtotal
    self.total = (self.subtotal * self.tax) + self.shipping
    self.save
  end

  def calculate_subtotal
    subtotal = 0
    items.each { |item| subtotal += (item.product.price * item.quantity) }
    subtotal
  end

  def remove_items!
    Order.transaction do
      items.each { |item| item.destroy! }
      self.items = []
    end
  rescue => e
    e.message
  end
end

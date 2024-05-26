class Order < ApplicationRecord
  
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  def total
    line_items.inject(0) { |sum, item| sum + (item.quantity * item.product.price) }
  end

end

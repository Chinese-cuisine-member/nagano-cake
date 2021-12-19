class CartsItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  # validates :quantity, numericality: { only_integer: true }
  # validates :quantity, numericality: { in: 1..24 }

  def subtotal
    item.with_tax_price * quantity
  end
end

class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum produciton_status: {cannot_make: 0, wait_for_making: 1, making: 2, complete: 3}
end

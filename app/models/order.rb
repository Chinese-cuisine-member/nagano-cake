class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  enum payment_method: {creditcard: 0, bank: 1}
	enum status: {waiting_payment: 0, confirmed_payment: 1, making: 2, prepare_shipment: 3, shiped: 4}
end

class Ship < ApplicationRecord
  belongs_to :customer

  validates :zipcode, :address, :name, presence: true

  def full_address
    '〒' + zipcode + ' ' + address + ' ' + name
  end
end

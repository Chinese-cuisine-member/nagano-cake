class Ship < ApplicationRecord
  belongs_to :customer
  
  def full_address
    '〒' + zipcode + ' ' + address + ' ' + name
  end
end

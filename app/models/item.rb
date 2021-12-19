class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :carts_items, dependent: :destroy
  attachment :image

  validates :genre_id, :name, :price, :explanation, presence: true

  def with_tax_price
    (price * 1.1).floor
  end
end

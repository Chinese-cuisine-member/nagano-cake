class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :carts_items, dependent: :destroy
  has_many :ships, dependent: :destroy
  
  validates :email, :last_name, :first_name, :last_name_kana, :first_name_kana,
  :zipcode, :address, :phone_number, presence: true
end

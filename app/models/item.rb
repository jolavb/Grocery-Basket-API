class Item < ApplicationRecord
  belongs_to :store
  has_many :carts
  has_many :users, through: :carts
end

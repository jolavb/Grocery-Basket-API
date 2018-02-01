class Item < ApplicationRecord
  belongs_to :store
  has_many :cart_items, dependent: :destroy
  has_many :users, through: :cart_items
  has_many :recipe_items, dependent: :destroy
  has_many :recipes, through: :recipe_items
end

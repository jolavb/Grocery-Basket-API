class Recipe < ApplicationRecord
  belongs_to :store
  has_many :recipe_items
  has_many :items, through: :recipe_items
end

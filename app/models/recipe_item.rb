class RecipeItem < ApplicationRecord
  belongs_to :item, inverse_of: :recipe_items
  belongs_to :recipe, inverse_of: :recipe_items
end

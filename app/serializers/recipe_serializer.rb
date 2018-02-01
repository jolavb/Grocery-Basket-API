class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :rec_id, :title, :image, :usedIngredientCount, :missedIngredientCount, :likes
  belongs_to :store
  has_many :items
end

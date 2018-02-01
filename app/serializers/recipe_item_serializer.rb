class RecipeItemSerializer < ActiveModel::Serializer
  attributes :id
  has_one :item
  has_one :recipe
end

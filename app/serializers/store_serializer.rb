class StoreSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lng, :location, :name
  has_many :items
end

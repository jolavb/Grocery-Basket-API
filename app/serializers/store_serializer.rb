class StoreSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lng, :location, :name
end

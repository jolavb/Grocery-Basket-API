class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :quantity, :unit, :price, :location, :start_date, :end_date, :image
end

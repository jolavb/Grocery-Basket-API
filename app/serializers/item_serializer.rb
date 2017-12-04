class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :quantity, :unit, :price, :location, :start_date, :end_date, :image
  belongs_to :store

  def start_date
    object.start_date.to_time.strftime('%l:%M %p %B %e')
  end

  def end_date
    object.end_date.to_time.strftime('%l:%M %p %B %e')
  end

end

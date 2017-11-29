class Cart < ApplicationRecord
  belongs_to :item, inverse_of: :carts
  belongs_to :user, inverse_of: :carts
end

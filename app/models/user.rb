# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
end

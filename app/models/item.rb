class Item < ApplicationRecord
  belongs_to :user

  validates :name, :description, :price_per_day, :location, presence: true
end

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :review
  belongs_to :item
end

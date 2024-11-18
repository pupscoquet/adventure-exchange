class Review < ApplicationRecord
  belongs_to :booking
  validates :score, inclusion: { in: (0..5) }
end

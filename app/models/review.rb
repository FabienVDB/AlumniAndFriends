class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reservation

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: 0..5
end

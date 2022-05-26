class Review < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :reservation, dependent: :destroy

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: 0..5
end

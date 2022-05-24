class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :alumni, class_name: "User"

  validates :alumni, if: :alumni?
  validates :location, presence: true
  validates :date, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def alumni?
    alumni.alumni
  end
end

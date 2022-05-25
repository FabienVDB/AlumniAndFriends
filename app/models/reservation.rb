class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :alumni, class_name: "User"

  validate :alumni_must_be_alumni
  validates :location, presence: true
  validates :date, presence: true
  validates :date, date: true
  validates :date, date: { after: proc { Time.now } }

  validates :duration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def alumni_must_be_alumni
    return if alumni.alumni

    errors.add(:alumni, "must be an alumni")
  end
end

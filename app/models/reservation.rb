class Reservation < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :provider, class_name: "User"

  has_many :reviews, dependent: :destroy

  validates :date, presence: true
  validates :date, date: true
  # validates :date, date: { after: proc { Time.now } }

  # validates :duration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

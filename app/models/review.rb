class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reservation

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: 0..5

  validate :user_cannot_be_alumni

  def user_cannot_be_alumni
    return unless user.alumni

    errors.add(:user, "cannot be an alumni")
  end
end

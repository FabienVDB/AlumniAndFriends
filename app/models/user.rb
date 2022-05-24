class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations
  has_many :obligations, class_name: "Reservation", foreign_key: "alumni_id"
  has_many_attached :photos

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :last_name, uniqueness: { scope: :first_name }

  validates :phone_number, format: { with: /0[1-9]((\s|-?)\d{2}(\s|-?)){4}/ }
  validates :description, presence: true
end

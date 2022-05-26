class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, class_name: "Reservation", foreign_key: "client_id"
  has_many :services, class_name: "Reservation", foreign_key: "provider_id"
  has_many :reviews
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :last_name, uniqueness: { scope: :first_name }

  validates :phone_number, format: { with: /0[1-9]((\s|-?)\d{2}(\s|-?)){4}/ }
  validates :location, presence: true
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_many :reservations, class_name: "Reservation", foreign_key: "client_id", dependent: :destroy
  has_many :services, class_name: "Reservation", foreign_key: "provider_id", dependent: :destroy
  has_many :reviews
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :last_name, uniqueness: { scope: :first_name }

  validates :phone_number, format: { with: /0[1-9]((\s|-?)\d{2}(\s|-?)){4}/ }
  validates :location, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_first_name,
    against: [ :first_name],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  pg_search_scope :search_by_service,
    against: [ :service],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end

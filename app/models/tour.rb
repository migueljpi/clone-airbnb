class Tour < ApplicationRecord
  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?

  CATEGORIES = ["Walking Tour", "Van Tour", "Bus Tour", "Free Tour", "Boat Tour"]
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
  belongs_to :user
  has_one_attached :photo
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :duration_in_hours, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  # validates :starting_time, presence: true
  validates :category, inclusion: { in: CATEGORIES, message: "%<value>s is not a valid type" }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location_and_description_and_sites_and_category,
                  against: %i[name location description sites category],
                  associated_against: {
                    user: %i[first_name last_name language]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end

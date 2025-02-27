class Tour < ApplicationRecord
  CATEGORIES = ["Walking Tour", "Van Tour", "Bus Tour", "Free Tour", "Boat Tour"]
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  belongs_to :user
  has_many_attached :photos
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :duration_in_hours, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :starting_time, presence: true
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid type" }
end

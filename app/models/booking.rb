class Booking < ApplicationRecord
  STATUS = ["Pending", "Confirmed", "Cancelled", "Completed", "No Show", "Refunded", "Rejected"]

  belongs_to :user
  belongs_to :tour
  has_one :review, dependent: :destroy

  validates :date, presence: true
  validates :pax, presence: true, numericality: { only_integer: true }
  validates :status, inclusion: { in: STATUS, message: "%<value>s is not a valid status" }
  validates :user_id, presence: true
  validates :tour_id, presence: true
end

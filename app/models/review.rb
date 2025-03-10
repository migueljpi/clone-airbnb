class Review < ApplicationRecord
  belongs_to :booking
  validates :tour_rating, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: false },
                          numericality: { only_integer: true }
  validates :guide_rating, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: false },
                           numericality: { only_integer: true }
  validates_uniqueness_of :booking_id, message: "can not leave more than one review for the same tour"
end

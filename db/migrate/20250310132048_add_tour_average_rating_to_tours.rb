class AddTourAverageRatingToTours < ActiveRecord::Migration[7.2]
  def change
    add_column :tours, :tour_average_rating, :float
  end
end

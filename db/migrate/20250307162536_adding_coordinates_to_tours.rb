class AddingCoordinatesToTours < ActiveRecord::Migration[7.2]
  def change
    add_column :tours, :starting_point_latitude, :float
    add_column :tours, :starting_point_longitude, :float
    add_column :tours, :ending_point_latitude, :float
    add_column :tours, :ending_point_longitude, :float
  end
end

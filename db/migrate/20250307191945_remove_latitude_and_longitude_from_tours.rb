class RemoveLatitudeAndLongitudeFromTours < ActiveRecord::Migration[7.2]
  def change
    remove_column :tours, :starting_point_latitude, :float
    remove_column :tours, :starting_point_longitude, :float
    remove_column :tours, :ending_point_latitude, :float
    remove_column :tours, :ending_point_longitude, :float
    remove_column :tours, :sites, :string
  end
end

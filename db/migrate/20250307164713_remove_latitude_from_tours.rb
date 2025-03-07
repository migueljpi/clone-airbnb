class RemoveLatitudeFromTours < ActiveRecord::Migration[7.2]
  def change
    remove_column :tours, :latitude, :float
    remove_column :tours, :longitude, :float
  end
end

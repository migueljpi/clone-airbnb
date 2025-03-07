class AddCoordinatesToTours < ActiveRecord::Migration[7.2]
  def change
    add_column :tours, :latitude, :float
    add_column :tours, :longitude, :float
  end
end

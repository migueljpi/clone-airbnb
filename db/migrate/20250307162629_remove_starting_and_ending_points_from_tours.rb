class RemoveStartingAndEndingPointsFromTours < ActiveRecord::Migration[7.2]
  def change
    remove_column :tours, :starting_point, :string
    remove_column :tours, :ending_point, :string
  end
end

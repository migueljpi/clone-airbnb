class AddDetailsToTours < ActiveRecord::Migration[7.2]
  def change
    add_column :tours, :starting_point, :string
    add_column :tours, :ending_point, :string
    add_column :tours, :sights, :text
  end
end

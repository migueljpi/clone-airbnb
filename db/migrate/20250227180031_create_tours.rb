class CreateTours < ActiveRecord::Migration[7.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :location
      t.text :description
      t.integer :duration_in_hours
      t.string :starting_point
      t.string :ending_point
      t.string :sites
      t.string :type
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.time :starting_time

      t.timestamps
    end
  end
end

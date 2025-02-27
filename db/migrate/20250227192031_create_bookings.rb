class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tour, null: false, foreign_key: true
      t.string :status
      t.date :date
      t.integer :pax

      t.timestamps
    end
  end
end

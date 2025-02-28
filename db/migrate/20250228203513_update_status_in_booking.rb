class UpdateStatusInBooking < ActiveRecord::Migration[7.2]
  def change
    change_column :bookings, :status, :string, default: "pending"
  end
end

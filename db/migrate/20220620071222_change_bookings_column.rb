class ChangeBookingsColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :Status, :status
    rename_column :bookings, :Reason, :reason
    rename_column :bookings, :Capacity, :capacity
  end
end

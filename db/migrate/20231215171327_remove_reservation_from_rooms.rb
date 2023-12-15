class RemoveReservationFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_reference :rooms, :reservation, null: false, foreign_key: true
  end
end

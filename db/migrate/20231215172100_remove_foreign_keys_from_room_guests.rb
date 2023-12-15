class RemoveForeignKeysFromRoomGuests < ActiveRecord::Migration[7.0]
  def change
    remove_reference :guests, :reservation, null: false, foreign_key: true
    remove_reference :guests, :guest, null: false, foreign_key: true
    remove_reference :guests, :room, null: false, foreign_key: true
  end
end

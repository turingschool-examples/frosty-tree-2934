class AddRoomsToGuests < ActiveRecord::Migration[7.0]
  def change
    add_reference :guests, :guest, null: false, foreign_key: true
  end
end

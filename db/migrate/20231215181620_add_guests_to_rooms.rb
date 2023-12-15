class AddGuestsToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :stay, :guest, null: false, foreign_key: true
  end
end
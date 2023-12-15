class AddColumnToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :reservation, null: false, foreign_key: true
  end
end

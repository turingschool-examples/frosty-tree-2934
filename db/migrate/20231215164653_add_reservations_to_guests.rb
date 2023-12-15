class AddReservationsToGuests < ActiveRecord::Migration[7.0]
  def change
    add_reference :guests, :reservation, null: false, foreign_key: true
  end
end

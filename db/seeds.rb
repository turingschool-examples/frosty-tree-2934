# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@turing = Hotel.create!(name: "Turing", location: "Colorado")
@fsa = Hotel.create!(name: "Fullstack Academy", location: "New York")

@turing_single_suite = Room.create!(rate: 130, suite: "Single", hotel_id: @turing.id)
@fsa_single_suite = Room.create!(rate: 150, suite: "Single", hotel_id: @fsa.id)

@rob = Guest.create!(name: "Rob", nights: 4)

@reservation_fsa = Reservation.create!(room_id: @fsa_single_suite.id, guest_id: @rob.id)
@reservation_turing = Reservation.create!(room_id: @turing_single_suite.id, guest_id: @rob.id)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GuestRoom.destroy_all
Guest.destroy_all
Room.destroy_all
Hotel.destroy_all

@hotel_echo = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
@hotel_cascade = Hotel.create!(name: "Vail Cascade", location: "Vail Mountain")
@guest_charlize = Guest.create!(name: "Charlize Theron", nights: 3)
@room_pres = Room.create!(rate: 125, suite: "Presidential", hotel_id: @hotel_echo.id)
@room_honey = Room.create!(rate: 100, suite: "Honeymoon", hotel_id: @hotel_echo.id)
@room_view_1 = Room.create!(rate: 500, suite: "View 1", hotel_id: @hotel_cascade.id)
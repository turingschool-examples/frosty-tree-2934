# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
hotel_1 = Hotel.create!(name: "Echo Mountain Inn", location: "Echo Mountain")
hotel_2 = Hotel.create!(name: "A-basin Hotel", location: "A-basin")

room_1 = hotel_1.rooms.create!(rate: 100, suite: "Presidential")
room_2 = hotel_1.rooms.create!(rate: 75, suite: "Regular")
room_3 = hotel_1.rooms.create!(rate: 60, suite: "Economy")

room_4 = hotel_2.rooms.create!(rate: 110, suite: "Presidential")
room_5 = hotel_2.rooms.create!(rate: 85, suite: "Regular")
room_6 = hotel_2.rooms.create!(rate: 70, suite: "Economy")

guest_1 = Guest.create!(name: "George", nights: 2)
guest_2 = Guest.create!(name: "Suzy", nights: 3)
guest_3 = Guest.create!(name: "Will", nights: 4)
guest_4 = Guest.create!(name: "Philip", nights: 4)
guest_5 = Guest.create!(name: "Hank", nights: 1)

guest_room_1 = GuestRoom.create!(guest_id: guest_1.id, room_id: room_1.id)
guest_room_2 = GuestRoom.create!(guest_id: guest_2.id, room_id: room_1.id)
guest_room_3 = GuestRoom.create!(guest_id: guest_3.id, room_id: room_2.id)
guest_room_4 = GuestRoom.create!(guest_id: guest_4.id, room_id: room_2.id)
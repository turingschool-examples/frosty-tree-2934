# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@hotel_1 = Hotel.create!(name: "Best Eastern", location: "123 Highway 21")
@guest_1 = Guest.create!(name: "John Smith")
@guest_2 = Guest.create!(name: "Jane Smith")
@room_1 = @hotel_1.rooms.create!(suite: "Master", rate: 300)
@room_2 = @hotel_1.rooms.create!(suite: "Economy", rate: 100)
@room_3 = @hotel_1.rooms.create!(suite: "Deluxe", rate: 200)


Stay.create!(guest: @guest_1, room: @room_1)
Stay.create!(guest: @guest_1, room: @room_2)
Stay.create!(guest: @guest_2, room: @room_1)

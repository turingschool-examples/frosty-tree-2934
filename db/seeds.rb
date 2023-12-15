# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
holiday_inn = Hotel.create(name: "Holiday Inn", location: "Mars")
honeymoon_suite = holiday_inn.rooms.create(rate: 25, suite: "Honeymoon")
florence = honeymoon_suite.guests.create(name: "Florence Pugh", nights: 12)

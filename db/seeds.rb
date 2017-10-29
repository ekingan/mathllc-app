# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Preparer.create!(first_name: "Emily", last_name: "Kingan")
Preparer.create!(first_name: "Jenna", last_name: "Goldin")
Preparer.create!(first_name: "Amanda", last_name: "Wiles")
Preparer.create!(first_name: "Uto", last_name: "Iha")
User.create!(email: 'ekingan@mathllc.com', password: 'password', password_confirmation: 'password', role: 'admin', preparer_id: 1)
User.create!(email: 'jenna@mathllc.com', password: 'password', password_confirmation: 'password', role: 'admin', preparer_id: 2)
User.create!(email: 'amanda@mathllc.com', password: 'password', password_confirmation: 'password', role: 'preparer', preparer_id: 3)
User.create!(email: 'uto@mathllc.com', password: 'password', password_confirmation: 'password', role: 'preparer', preparer_id: 4)

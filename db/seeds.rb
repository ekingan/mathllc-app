# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'ekingan@mathllc.com', password: 'password', password_confirmation: 'password', role: 'admin')
User.create!(email: 'jenna@mathllc.com', password: 'password', password_confirmation: 'password', role: 'admin')
User.create!(email: 'amanda@mathllc.com', password: 'password', password_confirmation: 'password', role: 'preparer')
User.create!(email: 'brian@mathllc.com', password: 'password', password_confirmation: 'password', role: 'preparer')
User.create!(email: 'debbie@mathllc.com', password: 'password', password_confirmation: 'password', role: 'preparer')

Preparer.create!(first_name: "Emily", last_name: "Kingan", user_id: 1)
Preparer.create!(first_name: "Jenna", last_name: "Goldin", user_id: 2)
Preparer.create!(first_name: "Amanda", last_name: "Wiles", user_id: 3)
Preparer.create!(first_name: "Brian", last_name: "Frank", user_id: 4)
Preparer.create!(first_name: "Debbie", last_name: "Doyle-Clavon", user_id: 5)

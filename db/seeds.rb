# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroy users"
User.destroy_all if Rails.env.development?
puts "destroy reservations"
Reservation.destroy_all if Rails.env.development?
puts "destroy review"
Review.destroy_all if Rails.env.development?

User.create!(email: "fabvdb@hotmail.com",
             password: "fabien_secret",
             alumni: true,
             first_name: "Fabien",
             last_name: "VAN DEN BERG",
             phone_number: "0645210239",
             description: "Je peux t'aider à coder en Ruby")

User.create!(email: "zanounekalid@.com",
             password: "kalid_secret",
             alumni: true,
             first_name: "Kalid",
             last_name: "ZANOUNE",
             phone_number: "0623154496",
             description: "Je peux être un super buddy")

User.create!(email: "herezy2006@gmail.com",
             password: "kevin_secret",
             alumni: true,
             first_name: "Kevin",
             last_name: "HANG",
             phone_number: "0659763106",
             description: "Je peux donner des cours de surf et de natation")

User.create!(email: "alain.verse@gmail.com",
             password: "alain_secret",
             first_name: "Alain",
             last_name: "VERSE",
             phone_number: "0545785241",
             description: "J'ai besoin d'aider pour coder en ruby")

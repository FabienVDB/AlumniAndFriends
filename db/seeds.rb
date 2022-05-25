# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "destroy all users"
User.destroy_all if Rails.env.development?
puts "destroy all reservations"
Reservation.destroy_all if Rails.env.development?
puts "destroy all reviews"
Review.destroy_all if Rails.env.development?

puts "Create fabien"
fabien = User.new(email: "fabvdb@hotmail.com",
                  password: "fabien_secret",
                  alumni: true,
                  first_name: "Fabien",
                  last_name: "VAN DEN BERG",
                  phone_number: "0645210239",
                  description: "Je peux t'aider à apprendre musique")
file = URI.open('https://res.cloudinary.com/alumniandfriends/image/upload/v1653473508/AlumniAndFriends/Photo%20AirBnb/Fabien_z6mqph.jpg')
fabien.photo.attach(io: file, filename: 'Fabien.jpg', content_type: 'image/png')
fabien.save

puts "Create kalid"
kalid = User.new(email: "zanounekalid@.com",
                 password: "kalid_secret",
                 alumni: true,
                 first_name: "Kalid",
                 last_name: "ZANOUNE",
                 phone_number: "0623154496",
                 description: "Je peux être un super buddy")
file = URI.open('https://res.cloudinary.com/alumniandfriends/image/upload/v1653473508/AlumniAndFriends/Photo%20AirBnb/kalid_nplkdy.jpg')
kalid.photo.attach(io: file, filename: 'kalid.jpg', content_type: 'image/png')
kalid.save

puts "Create kevin"
kevin = User.new(email: "herezy2006@gmail.com",
                 password: "kevin_secret",
                 alumni: true,
                 first_name: "Kevin",
                 last_name: "HANG",
                 phone_number: "0659763106",
                 description: "Je peux donner des cours de surf et de natation")
file = URI.open('https://res.cloudinary.com/alumniandfriends/image/upload/v1653473508/AlumniAndFriends/Photo%20AirBnb/Kevin_i2wuht.jpg')
kevin.photo.attach(io: file, filename: 'Kevin.jpg', content_type: 'image/png')
kevin.save

puts "Create jonathan"
jonathan = User.new(email: "jonathan.serafini@lewagon.org",
                    password: "jonathan_secret",
                    first_name: "Jonathan",
                    last_name: "SERAFINI",
                    phone_number: "0123456789",
                    description: "J'ai besoin d'aider pour coder en ruby")
file = URI.open('https://res.cloudinary.com/alumniandfriends/image/upload/v1653473508/AlumniAndFriends/Photo%20AirBnb/jonathan_jftdnu.jpg')
jonathan.photo.attach(io: file, filename: 'jonathan.jpg', content_type: 'image/png')
jonathan.save

puts "Done"

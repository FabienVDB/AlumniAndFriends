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
                  password: "secret",
                  first_name: "Fabien",
                  last_name: "VAN DEN BERG",
                  phone_number: "0645210239",
                  service: "Je peux t'aider à apprendre la musique",
                  location: "60 avenue Pasteur Pessac",
                  reward: "2 bières")
file = URI.open('https://res.cloudinary.com/alumniandfriends/image/upload/v1653473508/AlumniAndFriends/Photo%20AirBnb/Fabien_z6mqph.jpg')
fabien.photo.attach(io: file, filename: 'Fabien.jpg', content_type: 'image/png')
fabien.save

puts "Create kalid"
kalid = User.new(email: "zanounekalid@.com",
                 password: "secret",
                 first_name: "Kalid",
                 last_name: "ZANOUNE",
                 phone_number: "0623154496",
                 service: "Je peux être un super buddy",
                 location: "10 La canebière Marseille",
                 reward: "5 shots")
file = URI.open('https://res.cloudinary.com/alumniandfriends/image/upload/v1653473508/AlumniAndFriends/Photo%20AirBnb/kalid_nplkdy.jpg')
kalid.photo.attach(io: file, filename: 'kalid.jpg', content_type: 'image/png')
kalid.save

puts "Create kevin"
kevin = User.new(email: "herezy2006@gmail.com",
                 password: "secret",
                 first_name: "Kevin",
                 last_name: "HANG",
                 phone_number: "0659763106",
                 service: "Je peux donner des cours de surf et de natation",
                 location: "15 rue de Rivoli Paris",
                 reward: "2 cocktails")
file = URI.open('https://res.cloudinary.com/alumniandfriends/image/upload/v1653473508/AlumniAndFriends/Photo%20AirBnb/Kevin_i2wuht.jpg')
kevin.photo.attach(io: file, filename: 'Kevin.jpg', content_type: 'image/png')
kevin.save

puts "Create jonathan"
jonathan = User.new(email: "jonathan.serafini@lewagon.org",
                    password: "secret",
                    first_name: "Jonathan",
                    last_name: "SERAFINI",
                    phone_number: "0123456789",
                    service: "Je peux t'aider à coder en ruby",
                    location: "107 cours Balguerie Stuttenberg Bordeaux",
                    reward: "Pour rien !")
file = URI.open('https://res.cloudinary.com/alumniandfriends/image/upload/v1653473508/AlumniAndFriends/Photo%20AirBnb/jonathan_jftdnu.jpg')
jonathan.photo.attach(io: file, filename: 'jonathan.jpg', content_type: 'image/png')
jonathan.save

puts "Create reservation: provider: kalid, client: fabien, on 2022-05-30"
res1 = Reservation.create!(provider: kalid, client: fabien, date: "2022-05-30")
puts "Create reservation: provider: kalid, client: kevin, on 2022-06-05"
res2 = Reservation.create!(provider: kalid, client: kevin, date: "2022-06-05")
puts "Create reservation: provider: jonathan, client: fabien, on 2022-06-11"
res3 = Reservation.create!(provider: jonathan, client: fabien, date: "2022-06-11")
puts "Create reservation: provider: fabien, client: kevin, on 2022-06-15"
res4 = Reservation.create!(provider: fabien, client: kevin, date: "2022-06-15")

puts "Create reviews"
Review.create!(user: fabien, reservation: res1, rating: 5, comment: "Vraiment un super buddy")
Review.create!(user: kevin, reservation: res2, rating: 4, comment: "Super sympa")
Review.create!(user: fabien, reservation: res3, rating: 5, comment: "Exceptionnel")
Review.create!(user: fabien, reservation: res4, rating: 4, comment: "Super")
puts "Done"

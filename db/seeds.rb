# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

cities = ['Berlin', 'Cottbus', 'Eberswalde', 'Frankurt an der Oder', 'Potsdam', 'Schwedt',
          'Bremen', 'Bremerhaven', 'Hamburg', 'Munich', 'Nürnberg', 'Dinkelsbühl', 'Cologne',
          'Düsseldorf', 'Gelsenkirchen', 'Dortmund', 'Essen', 'Bonn', 'Hamm', 'Münster']


puts "removing the world! (cleaning up database)"
Booking.destroy_all
User.destroy_all

puts "creating users"
20.times do
  name = Faker::Name.name.split(' ')
  person = User.create!(
    first_name: name.first,
    last_name: name.last,
    email: Faker::Internet.email,
    password: "password"
  )
end

puts "the people are here"
i = User.first.id
cities.each do |city|
  dog = Dog.new(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    size: ['small', 'med-small', 'medium', 'med-large', 'large'].sample,
    category: ['guide dog', 'emotional support', 'kid-friendly', 'search and rescue'].sample,
    city: city
  )
  dog.user = User.find(i)
  pic_url = URI.open("https://source.unsplash.com/500x400/?#{dog.breed}")
  dog.photo.attach(io: pic_url, filename: "#{dog.name}_#{dog.breed}.png", content_type: 'image/png')
  dog.save!
  i += 1
end

puts "the people each have a dog, how nice"

puts "make some bookings"
bill = User.first
tom = User.last
fido = Dog.second
spike = Dog.third
first_booking = Booking.new(date: '1-1-2021', status: 'pending')
first_booking.user = bill
first_booking.dog = fido
first_booking.save!
second_booking = Booking.new(date: '1-1-2021', status: 'pending')
second_booking.user = tom
second_booking.dog = fido
second_booking.save!
third_booking = Booking.new(date: '1-1-2021', status: 'denied')
third_booking.user = tom
third_booking.dog = spike
third_booking.save!
puts "successfully booked"

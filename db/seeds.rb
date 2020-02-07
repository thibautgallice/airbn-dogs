# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all
City.destroy_all

c = 0
10.times do
  City.create(name:Faker::Address.city)
  c += 1
  puts "City #{c} created !"
end
d = 0
45.times do
  Dog.create(name:Faker::Creature::Dog.name, city: City.all.sample)
  d += 1
  puts "Dog #{d} created !"
end

ds = 0
20.times do
  Dogsitter.create(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, city: City.all.sample)
  ds += 1
  puts "Dogsitter #{ds} created !"
end

s = 0
140.times do
  Stroll.create(dogsitter: Dogsitter.all.sample, dog: Dog.all.sample)
  s += 1
  puts "Stroll #{s} created !"
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

# Créer des Cities
20.times do
  city = City.create!(city_name: Faker::Address.city)
  puts "City : #{city.city_name} created"
end

# Créer des Dogsitters
50.times do
  dogsitter = Dogsitter.create!(first_name: Faker::Name.first_name, city:City.all.sample)
  puts "Dogsitter : #{dogsitter.first_name} created"
end

# Créer des Dogs
200.times do
  dog = Dog.create!(name: Faker::Name.first_name,city:City.all.sample,prefered_snack:Faker::Cannabis.cannabinoid)
  puts "Dog : #{dog.name} created"
end

# Créer des Strolls
n = 0
200.times do
  random_ds = Dogsitter.all.sample
  random_dog = Dog.all.sample
  stroll = Stroll.create!(dogsitter:random_ds,dog:random_dog)
  n = n+1
  puts "Stroll #{n} created"
end
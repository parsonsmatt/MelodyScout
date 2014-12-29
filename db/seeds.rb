# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User seeding:
User.create!(name: "Matt Parsons",
             email: "parsonsmatt@gmail.com",
             password: "qwerasdf",
             password_confirmation: "qwerasdf",
             admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "user#{n+1}@#{Faker::Internet.domain_name}"
  pw = 'password123'
  User.create!(name: name, email: email, password: pw, password_confirmation: pw)
end

# Artist seeding:
Artist.create!(name: "Ne Obliviscaris")
Artist.create!(name: "Alas, Tyranny")
Artist.create!(name: "Tim Chester")
Artist.create!(name: "Matt Parsons")

99.times do |n|
  Artist.create!(name: "#{Faker::Address.city_suffix} #{Faker::Hacker.ingverb}",
  description: Faker::Lorem.paragraph )
end

# Membership seeding:
neo = Artist.find_by(name: "Ne Obliviscaris")
tim = Artist.find_by(name: "Tim Chester")
at =  Artist.find_by(name: "Alas, Tyranny")
mp =  Artist.find_by(name: "Matt Parsons")
at.add_member(mp)
neo.add_member(tim)

# Release seeding:
Release.create!(name: "Portal of I", date: 2.years.ago )
Release.create!(name: "Monolithic", date: 2.years.ago )

99.times do |n|
  Release.create!(name: Faker::App.name, date: Faker::Date.between(10.years.ago, 10.years.from_now), description: Faker::Lorem.paragraph)
end

# Contribution seeding:
poi = Release.find_by(name: "Portal of I")
mon = Release.find_by(name: "Monolithic")
at.add_release(mon)
mp.add_release(mon)
neo.add_release(poi)
tim.add_release(poi)


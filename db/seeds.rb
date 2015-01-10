# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User seeding:
me = User.create!(name: "Matt Parsons",
             email: "parsonsmatt@gmail.com",
             password: "qwerasdf",
             password_confirmation: "qwerasdf",
             activated: true,
             activated_at: Time.zone.now,
             admin: true)

1000.times do |n|
  name = Faker::Name.name
  email = "user#{n+1}@#{Faker::Internet.domain_name}"
  pw = 'password123'
  User.create!( name: name, 
                email: email, 
                password: pw, 
                password_confirmation: pw, 
                activated: true, activated_at: Time.zone.now
              )
end

# Artist seeding:
neo = Artist.create!(name: "Ne Obliviscaris", description: Faker::Lorem.paragraph)
at = Artist.create!(name: "Alas, Tyranny", description: Faker::Lorem.paragraph)
tim = Artist.create!(name: "Tim Chester", description: Faker::Lorem.paragraph, individual: true)
mp = Artist.create!(name: "Matt Parsons", description: Faker::Lorem.paragraph, individual: true)

1000.times do |n|
  Artist.create!(name: "#{Faker::Address.city_suffix} #{Faker::Hacker.ingverb}",
  description: Faker::Lorem.paragraph,
  individual: [true,false].sample)
end

# Membership seeding:
at.add_member(mp)
neo.add_member(tim)

# Follower seeding:
me.follow(neo)
me.follow(at)
me.follow(tim)
me.follow(mp)

# Release seeding:
poi = Release.create!(name: "Portal of I", description: Faker::Lorem.paragraph)
mon = Release.create!(name: "Monolithic", description: Faker::Lorem.paragraph)

100.times do |n|
  a=Release.create!(name: Faker::App.name, description: Faker::Lorem.paragraph)
  a.release_dates.create(date: Faker::Date.between(10.years.ago, 10.years.from_now)
end

# Contribution seeding:
at.add_release(mon)
mp.add_release(mon)
neo.add_release(poi)
tim.add_release(poi)


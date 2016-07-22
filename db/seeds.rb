# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.email
  password = Faker::Internet.password(8)
  page= Faker::Internet.url
  address = Faker::Address.street_address + " "+ Faker::Address.street_name
  postal_code = Faker::Address.zip
  locality = Faker::Address.city
  prof_area = Faker::Company.profession
  presentation = Faker::Lorem.sentence(10)
  birth_date = Faker::Date.between(40.years.ago, 20.years.ago)
  User.create!(name: name,
               email: email,
               password:              password,
               password_confirmation: password,
               entitie: 0,
               address: address,
               postal_code: postal_code,
               locality: locality,
               phone: '123456789',
               cellphone: '123456789',
               page: page,
               birth_date: birth_date,
               idnum: '123456789',
               prof_area: prof_area,
               presentation: presentation,
               skills: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum. ',
               prof_experience: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum. ',
               skill_level: 'Licenciatura',
               prof_situation: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum. ')
end

20.times do |n|
  name  = Faker::Company.name
  email = Faker::Internet.email
  password = Faker::Internet.password(8)
  page= Faker::Internet.url
  address = Faker::Address.street_address + " "+ Faker::Address.street_name
  postal_code = Faker::Address.zip
  locality = Faker::Address.city
  prof_area = Faker::Company.profession
  presentation = Faker::Lorem.sentence(10)
  User.create!(name: name,
               email: email,
               password:              password,
               password_confirmation: password,
               entitie: 1,
               address: address,
               postal_code: postal_code,
               locality: locality,
               phone: '123456789',
               cellphone: '123456789',
               page: page,
               birth_date: Time.zone.now,
               idnum: '123456789',
               prof_area: prof_area,
               presentation: presentation)
end

20.times do |n|
  title  = Faker::Book.title
  date = Faker::Date.between(Date.today, 2.years.from_now)
  summary = Faker::Lorem.sentence(10)
  text = Faker::Lorem.paragraph(4)
  News.create!(title: title,
               date: date,
               summary:summary,
               text:text)
end

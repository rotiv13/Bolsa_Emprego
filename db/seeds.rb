# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password:              password,
               password_confirmation: password,
               entitie: 0,
               address: "Rua da Lionesa",
               postal_code: '4050',
               locality: 'Porto',
               phone: '123456789',
               cellphone: '123456789',
               page: 'google.com',
               birth_date: Time.zone.now,
               idnum: '123456789',
               prof_area: 'Informática',
               presentation: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum. ',
               skills: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum. ',
               prof_experience: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum. ',
               skill_level: 'Licenciatura',
               prof_situation: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum. ')
end

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+21}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password:              password,
               password_confirmation: password,
               entitie: 1,
               address: "Rua da Lionesa",
               postal_code: '4050',
               locality: 'Porto',
               phone: '123456789',
               cellphone: '123456789',
               page: 'google.com',
               birth_date: Time.zone.now,
               idnum: '123456789',
               prof_area: 'Informática',
               presentation: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum. ')
end
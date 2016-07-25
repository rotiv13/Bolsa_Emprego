# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: 'BackOffice',
             email: 'bakcoffice@bolsaemprego.com',
             password:              'admin123',
             password_confirmation: 'admin123',
             entitie: 0,
             address: 'Bolsa de Emprego',
             postal_code: '4050',
             locality: 'Porto',
             phone: '123456789',
             cellphone: '123456789',
             page: 'bolsaemprego.com',
             birth_date: Time.zone.now,
             idnum: '123456789',
             prof_area: 'Admin',
             picture: 'http://www.iconsfind.com/wp-content/uploads/2015/08/20150831_55e46b18e2a80.png',
             presentation: 'Administrador do Website Bolsa de Emprego',
             activated: true,
             activated_at: Time.zone.now,
             admin: true
)



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
  picture = 'http://www.iconsfind.com/wp-content/uploads/2015/08/20150831_55e46b18e2a80.png'
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
               birth_date: birth_date,
               idnum: '123456789',
               prof_area: prof_area,
               presentation: presentation,
               picture: picture,
               skills: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum. ',
               prof_experience: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum. ',
               skill_level: 'Licenciatura',
               prof_situation: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum. ',
               activated: true,
               activated_at: Time.zone.now,
               admin: false)
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
  picture = 'http://www.iconsfind.com/wp-content/uploads/2015/08/20150831_55e46b18e2a80.png'
  User.create!(name: name,
               email: email,
               password:              password,
               password_confirmation: password,
               entitie: 2,
               address: address,
               postal_code: postal_code,
               locality: locality,
               phone: '123456789',
               cellphone: '123456789',
               page: page,
               birth_date: Time.zone.now,
               idnum: '123456789',
               picture: picture,
               prof_area: prof_area,
               presentation: presentation,
               activated: true,
               activated_at: Time.zone.now,
               admin: false)
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

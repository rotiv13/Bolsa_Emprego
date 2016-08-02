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
             presentation: 'Administrador do Website Bolsa de Emprego',
             activated: true,
             activated_at: Time.zone.now,
             admin: true
)

User.create!(name: 'Candidato',
             email: 'vitorafonso_32@hotmail.com',
             password:              '123456',
             password_confirmation: '123456',
             entitie: 1,
             address: 'Bolsa de Emprego',
             postal_code: '4050',
             locality: 'Porto',
             phone: '123456789',
             cellphone: '123456789',
             page: 'bolsaemprego.com',
             birth_date: Time.zone.now,
             idnum: '123456789',
             prof_area: 'Admin',
             presentation: 'Administrador do Website Bolsa de Emprego',
             activated: true,
             activated_at: Time.zone.now,
             admin: false
)

User.create!(name: 'Entidade',
             email: 'vitorafonso@hotmail.com',
             password:              '123456',
             password_confirmation: '123456',
             entitie: 2,
             address: 'Bolsa de Emprego',
             postal_code: '4050',
             locality: 'Porto',
             phone: '123456789',
             cellphone: '123456789',
             page: 'bolsaemprego.com',
             birth_date: Time.zone.now,
             idnum: '123456789',
             prof_area: 'Admin',
             presentation: 'Administrador do Website Bolsa de Emprego',
             activated: true,
             activated_at: Time.zone.now,
             admin: false
)



20.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.email
  password = Faker::Internet.password(8)
  page= Faker::Internet.url
  address = Faker::Address.street_address + " "+ Faker::Address.street_name
  postal_code = Faker::Address.zip
  locality = Faker::Address.city
  prof_area = ['Programador Web','Web Designer','Administrador Sistemas','Administrador Redes'].shuffle.sample
  skill_level = ['Secundário','Licenciatura','Mestrado','Doutoramento'].shuffle.sample
  prof_situation = ['Empregado','Desempregado'].shuffle.sample
  presentation = Faker::Lorem.sentence(10)
  birth_date = Faker::Date.between(40.years.ago, 20.years.ago)
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
               skills: skill_level,
               prof_experience: '3 anos de experiência',
               skill_level: skill_level,
               prof_situation: prof_situation,
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
  prof_area = ['Informática','Educação','Saúde','Metalúrgica','Prestação de Serviços'].shuffle.sample
  presentation = Faker::Lorem.sentence(10)
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
  destaque = true
  active = true
  News.create!(title: title,
               date: date,
               summary:summary,
               text:text,
               destaque: destaque,
               active: active)
end

# 15.times do |n|
#   title  = Faker::Book.title
#   date_begin = Faker::Date.between(Date.today, 1.month.from_now)
#   date_end = Faker::Date.between(1.month.from_now, 2.month.from_now)
#   summary = Faker::Lorem.sentence(20)
#   Offer.create!(title: title,
#                 date_begin: date_begin,
#                 date_end: date_end,
#                 prof_area: 'Informática',
#                 description:summary,
#                 type_contract: "Full-time",
#                 salary: '1000-1500',
#   user_id: 1)
# end

users = User.order(:created_at).where(entitie: 2).take(6)
5.times do
  title = Faker::Book.title
  content = Faker::Lorem.sentence(10)
  prof_area = ['Programador Web','Web Designer','Administrador Sistemas','Administrador Redes','Asistente Social'].shuffle.sample
  date_begin = Faker::Date.between(Date.today, 2.months.from_now)
  date_end = Faker::Date.between(2.months.from_now, 4.months.from_now)
  users.each { |user| user.offers.create!(title:title, description: content,
                                          date_begin: date_begin, date_end: date_end,
                                          active: true, prof_area: prof_area, locality: user.locality)
  }
end

users = User.all
user  = users.second
following = users[3..20]
followers = users[20..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }



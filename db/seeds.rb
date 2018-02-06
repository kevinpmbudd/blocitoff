require 'faker'

3.times do
  pw = Faker::Internet.password(8)
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: pw,
    password_confirmation: pw,
    confirmed_at: Time.now.utc
  )
end

User.create!(
  name: "Kevin",
  email: "kevin@kevinbudd.com",
  password: 'helloworld',
  password_confirmation: 'helloworld',
  confirmed_at: Time.now.utc
)
users = User.all

20.times do
  Item.create!(
    user: users.sample,
    name: Faker::Food.dish
  )
end

puts "#{User.count} users"
puts "#{Item.count} items"

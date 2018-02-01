require 'faker'

FactoryBot.define do
  pw = Faker::Internet.password(8)
  factory :user do
    name Faker::Pokemon.name
    sequence(:email){|n| "user#{n}@blocitoff_factory.edu" }
    password pw
    password_confirmation pw
    confirmed_at Time.now.utc
  end
end

require 'faker'

FactoryBot.define do
  factory :item do
    name Faker::Hipster.sentence
    user
  end
end

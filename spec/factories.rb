require 'faker'

FactoryGirl.define do
  factory :wine do
    name { Faker::Lorem.sentence(3) }
    url  {Faker::Internet.url }
    min_price { Faker::Number.between(10.00, 20.00).round(2) }
    max_price { Faker::Number.between(20.00, 30.00).round(2) }
    retail_price { Faker::Number.between(35.00, 55.00).round(2) }
    kind "Wine"
  end
end

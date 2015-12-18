require 'faker'

FactoryGirl.define do
  factory :wine do |f|
    f.name { Faker::Hipster}
    f.url  {Faker::URL }
  end
end

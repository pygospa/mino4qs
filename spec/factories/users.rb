FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    birthday { Faker::Date.between(from: 100.year.ago, to: 18.years.ago) }
    height { Faker::Number.between(from: 0.5, to: 2.99) }
    sex { Faker::Gender.binary_type.downcase }
  end
end

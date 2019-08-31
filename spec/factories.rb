FactoryBot.define do
  factory :personal_data, class: PersonalData do
    birthday { '1984-03-10' }
    gender   { 'male' }
    height   { '168' }
  end
end

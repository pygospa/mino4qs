FactoryBot.define do
  factory :personal_data_set, class: PersonalDataSet do
    birthday { Date.new(1984, 3, 10) }
    gender   { 'male' }
    height   { '168' }
  end
end

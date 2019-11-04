FactoryBot.define do
  factory :personal_data_set, class: PersonalDataSet do
    birthday { DateTime.civil_from_format :local, 1984, 3, 10 }
    gender   { 'male' }
    height   { '168' }
  end
end

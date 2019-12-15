class PersonalDataSet < ApplicationRecord
  validates :birthday, presence: true,
                       date: { before: proc { Date.today - 17.years },
                               message: 'is not a date, in future, or a minor' }
  validates :gender, presence: true,
                     inclusion: { in: %w(male female),
                                  message: '%{value} is not a valid gender' }
  validates :height, presence: true,
                     numericality: { greater_than: 100, less_than: 300 }

  def age
    ((Time.current - birthday.to_time) / 1.year.seconds).floor
  end

  def to_s
    "PersonalDataSet: #{gender} (#{age}), #{birthday}, #{height}"
  end
end


class PersonalDataSet < ApplicationRecord
  attr_accessor :gender, :height

  validates :gender, :height, presence: true
end

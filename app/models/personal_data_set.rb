class PersonalDataSet < ApplicationRecord
  attr_accessor :height

  validates :height, presence: true
end

class PersonalDataSet < ApplicationRecord
  attr_accessor :birthday, :gender, :height

  validates :birthday, :gender, :height, presence: true

  def height(unit: 'centimeters')
    return @height
  end

end

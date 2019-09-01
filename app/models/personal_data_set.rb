class PersonalDataSet < ApplicationRecord
  attr_accessor :birthday, :gender, :height

  validates :birthday, :gender, :height, presence: true

  def height(unit: 'centimeters', return_unit: false)
    if return_unit
      return "#{@height} cm"
    end
    return @height
  end

end

class PersonalDataSet < ApplicationRecord
  attr_accessor :birthday, :gender, :height

  validates :birthday, :gender, :height, presence: true

  def height(unit: 'centimeters', return_unit: false)
    case unit
    when 'centimeters'
      return return_unit ? "#{@height} cm" : @height
    when 'inches'
      height_in = (@height.to_i / 2.54).round(2)
      return return_unit ? "#{height_in} in" : "#{height_in}"
    end
  end

end

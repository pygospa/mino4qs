class PersonalDataSet < ApplicationRecord
  attr_accessor :birthday, :gender, :height

  validates :birthday, :gender, :height, presence: true

  def height(unit: 'centimeters', return_unit: false)
    case unit
    when 'centimeters'
      return "#{@height} cm" if return_unit
      return @height
    when 'inches'
      return "#{(@height.to_i / 2.54).round(2)}"
    end
  end

end

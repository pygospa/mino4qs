class PersonalDataSet < ApplicationRecord
  attr_accessor :birthday, :gender, :height

  validates :birthday, :gender, :height, presence: true

  def height(unit: 'centimeters', return_unit: false)
    if unit == 'inches'
      return "#{(@height.to_i / 2.54).round(2)}"
    end

    if return_unit
      return "#{@height} cm"
    end
    return @height
  end

end

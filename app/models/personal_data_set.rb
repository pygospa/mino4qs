class PersonalDataSet < ApplicationRecord
  attr_accessor :birthday, :gender, :height

  validates :birthday, :gender, :height, presence: true

  def height(unit: 'centimeters', return_unit: false)
    unless @height.nil? or @height.empty?
      case unit
      when 'centimeters'
        return return_unit ? "#{@height} cm" : @height.to_i
      when 'feet'
        height_ft = (@height.to_i / 30.48).round(2)
        return return_unit ? "#{height_ft} ft" : height_ft
      when 'feet-and-inches'
        height_ft = (@height.to_i / 30.48)
        ft_part = height_ft.floor
        in_part = ((height_ft - ft_part) * 12).floor
        return "#{ft_part} ft #{in_part} in"
      when 'inches'
        height_in = (@height.to_i / 2.54).round(2)
        return return_unit ? "#{height_in} in" : height_in
      end
    end
  end

end

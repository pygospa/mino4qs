class PersonalDataSet < ApplicationRecord
  attr_accessor :birthday, :gender, :height

  validates :birthday, :gender, :height, presence: true

  def height(unit: 'centimeters', return_unit: false)

    puts "unit: #{unit}, return_unit: #{return_unit}"

    if return_unit
      puts "return_unit is true"
      return "#{@height} cm"
    end

    return @height
  end

end

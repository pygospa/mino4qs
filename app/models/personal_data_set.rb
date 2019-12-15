class PersonalDataSet < ApplicationRecord
#  attr_accessor :birthday, :gender, :height

  validates :birthday, :gender, :height, presence: true
  validates :birthday, date: true
  validates :birthday, date: {
    before: Proc.new { Time.now - 17.years },
    message: "is not yet born or a minor"
  }
  validates :gender, inclusion: {
    in: %w(male female), message: "%{value} is not a valid gender"
  }
  validates :height, numericality: { greater_than: 0 }

#  def height=(height)
#    @height = height
#  end

#  def height(unit: 'centimeters', with_symbol: false)
#    unless @height.nil? #or @height.empty?
#      case unit
#      when 'centimeters'
#        return with_symbol ? "#{@height} cm" : @height.to_i
#      when 'feet'
#        height_ft = (@height.to_i / 30.48).round(2)
#        return with_symbol ? "#{height_ft} ft" : height_ft
#      when 'feet-and-inches'
#        height_ft = (@height.to_i / 30.48)
#        ft_part = height_ft.floor
#        in_part = ((height_ft - ft_part) * 12).floor
#        return "#{ft_part} ft #{in_part} in"
#      when 'inches'
#        height_in = (@height.to_i / 2.54).round(2)
#        return with_symbol ? "#{height_in} in" : height_in
#      end
#    end
#  end

  def age
    ((Time.zone.now - birthday.to_time) / 1.year.seconds).floor
  end
end

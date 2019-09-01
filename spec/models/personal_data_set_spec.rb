require 'rails_helper'

RSpec.describe PersonalDataSet, type: :model do
  it "is valid with valid attributes"
  it "is not valid without birthday"
  it "is not valid without gender"
  it "is not valid without height"

  context '#height' do
    it "with no params returns height in centimeters"
    it "with 'in: \"centimeters\"' returns height in cm"
    it "with 'to_string: true' will return height in cm w/ unit"
    it "with 'in: \"centimeters\", to_string: true' returns height in cm w/ unit"
    it "with 'in: \"inches\"' returns height in in"
    it "with 'in: \"inches\", to_string: true' returns height in in w/ unit"
    it "with 'in: \"feet-and-inches\"' returns height in ft-in"
    it "with 'in: \"feet-and-inches\", to_string: true' returns height in ft-in w/ unit"
  end

  context '#age' do
    it "will return the current age for a given birthday"
  end

end

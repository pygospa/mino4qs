require 'rails_helper'

RSpec.describe PersonalDataSet, type: :model do

  subject do
    PersonalDataSet.new
  end

  it "is valid with valid attributes"

  it "is not valid without birthday" do
    subject.birthday = ''
    subject.valid?
    expect(subject.errors[:birthday]).to include("can't be blank")
  end

  it "is not valid without gender" do
    subject.gender = ''
    subject.valid?
    expect(subject.errors[:gender]).to include("can't be blank")
  end

  it "is not valid without height" do
    subject.height = ''
    subject.valid?
    expect(subject.errors[:height]).to include("can't be blank")
  end


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

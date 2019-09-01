require 'rails_helper'

RSpec.describe PersonalDataSet, type: :model do

  subject do
    PersonalDataSet.new
  end

  it "is valid with valid attributes" do
    subject = create(:personal_data_set)
    expect(subject.valid?).to be_truthy
  end

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
    it "with no params returns height in centimeters" do
      subject.height = '168'
      expect(subject.height).to eq('168')
    end

    it "with 'unit: \"centimeters\"' returns height in cm" do
      subject.height = '168'
      expect(subject.height(unit: 'centimeters')).to eq('168')
    end

    it "with 'to_string: true' will return height in cm w/ unit"
    it "with 'unit: \"centimeters\", to_string: true' returns height in cm w/ unit"
    it "with 'unit: \"inches\"' returns height in in"
    it "with 'unit: \"inches\", to_string: true' returns height in in w/ unit"
    it "with 'unit: \"feet-and-inches\"' returns height in ft-in"
    it "with 'unit: \"feet-and-inches\", to_string: true' returns height in ft-in w/ unit"
  end

  context '#age' do
    it "will return the current age for a given birthday"
  end

end

require 'rails_helper'

RSpec.describe PersonalDataSet, type: :model do

  subject do
    PersonalDataSet.new
  end

  context "#valid? returns true, if it" do
    it "is valid with valid attributes" do
      subject = create(:personal_data_set)
      expect(subject.valid?).to be_truthy
    end
  end

  context "#valid? returns false, if it" do
    it "has no @birthday" do
      subject.birthday = ''
      subject.valid?
      expect(subject.errors[:birthday]).to include("can't be blank")
    end

    it 'has non-date value for @birthday' do
      subject.birthday = 'elephant'
      subject.valid?
      expect(subject.errors[:birthday]).to include('blub')
    end

    it "has no @gender" do
      subject.gender = ''
      subject.valid?
      expect(subject.errors[:gender]).to include("can't be blank")
    end

    it "has other @gender than 'male' or 'female'" do
      subject.gender = 'elephant'
      subject.valid?
      expect(subject.errors[:gender]).to include("elephant is not a valid gender")
    end

    it "has no @height" do
      subject.height = ''
      subject.valid?
      expect(subject.errors[:height]).to include("can't be blank")
    end

    it "has zero @height" do
      subject.height = '0'
      subject.valid?
      expect(subject.errors[:height]).to include("must be greater than 0")
    end

    it "has a negative @height" do
      subject.height = '-100'
      subject.valid?
      expect(subject.errors[:height]).to include("must be greater than 0")
    end
  end

  context '#height' do
    before(:each) do
      subject.height = '168'
    end

    it "with no params returns height in centimeters" do
      expect(subject.height).to eq(168)
    end

    it "with 'unit: \"centimeters\"' returns height in cm" do
      expect(subject.height(unit: 'centimeters')).to eq(168)
    end

    it "with 'with_symbol: true' will return height in cm w/ unit" do
      expect(subject.height(with_symbol: true)).to eq('168 cm')
    end

    it "with 'unit: \"centimeters\", with_symbol: true' returns height in cm w/ unit" do
      expect(subject.height(unit: 'centimeters', with_symbol: true)).to eq('168 cm')
    end

    it "with 'unit: \"inches\"' returns height in in" do
      expect(subject.height(unit: 'inches')).to eq(66.14)
    end

    it "with 'unit: \"inches\", with_symbol: true' returns height in in w/ unit" do
      expect(subject.height(unit: 'inches', with_symbol: true)).to eq('66.14 in')
    end

    it "with 'unit: \"feet\"' returns height in ft" do
      expect(subject.height(unit: 'feet')).to eq(5.51)
    end

    it "with 'unit: \"feet\", with_symbol: true' returns height in ft w/ unit" do
      expect(subject.height(unit: 'feet', with_symbol: true)).to eq("5.51 ft")
    end

    it "with 'unit: \"feet-and-inches\"' returns height in ft-in w/ unit" do
      expect(subject.height(unit: 'feet-and-inches')).to eq("5 ft 6 in")
    end

    it "with 'unit: \"feet-and-inches\", with_symbol: true' returns height in ft-in w/ unit" do
      expect(subject.height(unit: 'feet-and-inches')).to eq("5 ft 6 in")
    end
  end

  context '#age' do
    it "will return the current age for a given birthday" do
      subject.height = "1984-03-10"
      expect(subject.age).to eq("35")
    end
  end

end

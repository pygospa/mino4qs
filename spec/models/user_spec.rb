require 'rails_helper'
include ActiveSupport::Testing::TimeHelpers

RSpec.describe User, type: :model do

  let(:blank_error) { "can't be blank" }
  let(:subject)     { FactoryBot.build(:user) }

  describe '#age' do
    it 'returns the current age for an user' do
      subject.birthday = '1980-02-26'
      travel_to Date.new(2019, 5, 16)
      expect(subject.age).to eq(39)
      travel_back
    end
  end

  describe "#birthday" do
    it 'is required' do
      subject.birthday = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:birthday]).to include(blank_error)
    end

    it 'cannot be blank' do
      subject.birthday = ''
      expect(subject).to_not be_valid
      expect(subject.errors[:birthday]).to include(blank_error)
    end

    it 'is of type Date' do
      subject.birthday = Faker::Date
      expect(subject).to_not be_valid
      expect(subject.errors[:birthday]).to include("is not a date")
    end

    it 'cannot be in the future' do
      subject.birthday = Date.today + 1.year
      expect(subject).to_not be_valid
      expect(subject.errors[:birthday]).to include("cannot be in the future")
    end

    it 'cannot be younger than 18 years' do
      subject.birthday = Date.today - 17.year
      expect(subject).to_not be_valid
      expect(subject.errors[:birthday]).to include("cannot be under 18 years")
    end
  end

  describe '#height' do
    let(:height_too_small_error) { 'must be greater than or equal to 0.5' }
    let(:height_too_large_error) { 'must be less than 3' }

    it 'is required' do
      subject.height = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:height]).to include(blank_error)
    end

    it 'cannot be blank' do
      subject.height = ''
      expect(subject).to_not be_valid
      expect(subject.errors[:height]).to include(blank_error)
    end

    it 'cannot be smaller than 0.5m' do
      subject.height = '0.49'
      expect(subject).to_not be_valid
      expect(subject.errors[:height]).to include(height_too_small_error)
    end

    it 'cannot be greater than 3m' do
      subject.height = '5'
      expect(subject).to_not be_valid
      expect(subject.errors[:height]).to include(height_too_large_error)
    end
  end

  describe '#sex' do
    it 'is required' do
      subject.sex = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:sex]).to include(blank_error)
    end

    it 'cannot be blank' do
      subject.sex = ''
      expect(subject).to_not be_valid
      expect(subject.errors[:sex]).to include(blank_error)
    end

    it 'has only the values "male" or "female"' do
      expect { subject.sex = 'elephant' }.to raise_error(ArgumentError)
    end
  end

  context 'factory' do
    it "creates valid objects" do
      expect(subject).to be_valid
    end
  end
end

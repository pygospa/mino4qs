require 'rails_helper'

RSpec.describe PersonalDataSet, type: :model do
  let(:subject)     { FactoryBot.create(:personal_data_set) }
  let(:blank_error) { "can't be blank" }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#birthday' do
    let(:date_error)  { 'is not a date, in future, or a minor' }

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

    it 'is of type "Date"' do
      subject.birthday = 'elephant'
      expect(subject).to_not be_valid
      expect(subject.errors[:birthday]).to include(date_error)
    end

    it 'cannot be in the future' do
      subject.birthday = DateTime.tomorrow
      expect(subject).to_not be_valid
      expect(subject.errors[:birthday]).to include(date_error)
    end

    it 'cannot be younger than 18 years' do
      subject.birthday = DateTime.now - 1.year
      expect(subject).to_not be_valid
      expect(subject.errors[:birthday]).to include(date_error)
    end
  end

  describe '#gender' do
    let(:gender_error) { 'elephant is not a valid gender' }

    it 'is required' do
      subject.gender = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:gender]).to include(blank_error)
    end

    it 'cannot be blank' do
      subject.gender = ''
      expect(subject).to_not be_valid
      expect(subject.errors[:gender]).to include(blank_error)
    end

    it 'has only the values "male" or "female"' do
      subject.gender = 'elephant'
      expect(subject).to_not be_valid
      expect(subject.errors[:gender]).to include(gender_error)
    end
  end

  describe '#height' do
    let(:height_too_small_error) { 'must be greater than 100' }
    let(:height_too_large_error) { 'must be less than 300' }

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

    it 'cannot be below 100' do
      subject.height = '0'
      expect(subject).to_not be_valid
      expect(subject.errors[:height]).to include(height_too_small_error)
    end

    it 'cannot be negative' do
      subject.height = '-100'
      expect(subject).to_not be_valid
      expect(subject.errors[:height]).to include(height_too_small_error)
    end

    it 'cannot be greater than 300 cm' do
      subject.height = '500'
      expect(subject).to_not be_valid
      expect(subject.errors[:height]).to include(height_too_large_error)
    end
  end

  describe '#age' do
    it 'returns the current age' do
      travel_to Time.new(2019, 5, 16, 0, 0, 0)
      subject.birthday = '1980-02-26'
      expect(subject.age).to eq(39)
    end
  end
end

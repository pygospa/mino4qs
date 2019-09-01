require 'rails_helper'

RSpec.describe 'personal_data/show.haml', type: :view do

  before(:each) do
    @personal_data = double('PersonalData', age: 35, gender: 'male')
    allow(@personal_data).to receive(:height)
      .with(in: 'meters', as_string: true)
      .and_return("1.68 m")
    allow(@personal_data).to receive(:height)
      .with(in: 'feet-and-inches', as_string: true)
      .and_return("5 ft 6 in")
    allow(@personal_data).to receive(:height)
      .with(in: 'inches', as_string: true)
      .and_return("66.1417 in")
  end

  it "displays the age of a person" do
    expect(render).to have_text "35"
  end

  it "displays the gender of a person" do
    expect(render).to have_text 'male'
  end

  it "displays the height of a person in meters" do
    expect(render).to have_text "1.68 m"
  end

  it "displays the height of a preson in feet & inches" do
    expect(render).to have_text '5 ft 6 in'
  end

  it "displays the height of a person in inches" do
    expect(render).to have_text "66.1417 in"
  end

end


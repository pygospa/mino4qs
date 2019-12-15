#require 'rails_helper'
#
#RSpec.describe 'personal_data_sets/show.haml', type: :view do
#
#  before(:each) do
#  end
#
#  it "displays the age of a person" do
#    personal_data_set = double('PersonalDataSet', age: 35, gender: 'male')
#    expect(render).to have_text "35"
#  end
#
#  it "displays the gender of a person" do
#    personal_data_set = double('PersonalDataSet', age: 35, gender: 'male')
#    expect(render).to have_text 'male'
#  end
#
#  it "displays the height of a person in meters" do
#    personal_data_set = double('PersonalDataSet', age: 35, gender: 'male')
#    allow(personal_data_set).to receive(:height)
#      .with(unit: 'meters', with_symbol: true)
#      .and_return("1.68 m")
#    expect(render).to have_text "1.68 m"
#  end
#
#  it "displays the height of a preson in feet & inches" do
#    personal_data_set = double('PersonalDataSet', age: 35, gender: 'male')
#    allow(personal_data_set).to receive(:height)
#      .with(unit: 'feet-and-inches', with_symbol: true)
#      .and_return("5 ft 6 in")
#    expect(render).to have_text '5 ft 6 in'
#  end
#
#  it "displays the height of a person in inches" do
#    personal_data_set = double('PersonalDataSet', age: 35, gender: 'male')
#    allow(personal_data_set).to receive(:height)
#      .with(unit: 'inches', with_symbol: true)
#      .and_return("66.1417 in")
#    expect(render).to have_text "66.1417 in"
#  end
#
#end
#

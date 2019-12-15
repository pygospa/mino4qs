require "rails_helper"
require 'support/capybara_selenium.rb'

RSpec.describe "PersonalDataSet", type: :system, js: true do
  scenario "if not yet recorded, can be added by the user and be displayed afterwards" do
    # given
    visit "/personal_data_sets"
    expect(page).to have_text("No personal data has been saved yet")
    expect(page).to have_link("Add personal data")
    expect(page).not_to have_text("35")
    expect(page).not_to have_text("male")
    expect(page).not_to have_text("168")
    # when
    visit "/personal_data_sets/new"
    fill_in "personal_data_set[birthday]", with: "03/10/1984"
    fill_in "personal_data_set[gender]", with: "male"
    fill_in "personal_data_set[height]", with: "168"
    click_button "Submit"
    # then
    expect(page).to have_text "Personal data successfully recorded"
    visit "/personal_data_sets"
    expect(page).not_to have_text("No personal data has been saved yet")
    expect(page).not_to have_button('Add personal data')
    expect(page).to have_text "35"
    expect(page).to have_text("male")
    expect(page).to have_text("168")
    expect(page).to have_link("Edit personal data")
  end
end


require "rails_helper"
require 'support/capybara_selenium.rb'

RSpec.describe "Personal data", type: :system, js: true do
  scenario "if not yet recorded, can be added by the user and be displayed afterwards" do
    # given
    visit "/personal_data"
    expect(page).to have_text("No personal data recorded yet")
    expect(page).to have_link("Add personal data")
    expect(page).not_to have_text("35")
    expect(page).not_to have_text("male")
    expect(page).not_to have_text("168")
    # when
    visit "/personal_data/new"
    fill_in "birthday", with: "1984-03-10"
    fill_in "gender", with: "male"
    fill_in "height", with: "168"
    click_button "Submit"
    # then
    expect(page).to have_text "Personal data successfully recorded"
    visit "/personal_data"
    expect(page).not_to have_text("No personal data recorded yet")
    expect(page).not_to have_button('Add personal data')
    expect(page).to have_text "35"
    expect(page).to have_text("male")
    expect(page).to have_text("168")
    expect(page).to have_link("Edit personal data")
  end
end


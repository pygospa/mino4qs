require "rails_helper"
require 'support/capybara_selenium.rb'

RSpec.describe "Personal data", type: :system, js: true do

  scenario "is added by the user to the database" do

    visit "/personal_data/new"

    fill_in "birthday", with: "1984-03-10"
    fill_in "gender", with: "male"
    fill_in "height", with: "168"

    click_button "Submit"

    expect(page).to have_text "Personal data successfully recorded"
  end
end


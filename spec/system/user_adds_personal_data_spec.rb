require "rails_helper"

RSpec.describe "Personal data", type: :system, js: true do

  it "can be added by user" do
    visit "/personal_data/new"

    fill_in "height", with: "168"
    fill_in "birthday", with: "1984-03-10"
    fill_in "gender", with: "male"

    click_button "Submit"

    expect(page).to have_text "Personal data successfully recorded"
  end
end



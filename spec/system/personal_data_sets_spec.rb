require 'rails_helper'
require 'support/capybara_selenium.rb'

RSpec.describe 'PersonalDataSet', type: :system, js: true do
  scenario 'if not yet recorded, can be added by the user and be displayed afterwards' do
    # given
    age = ((Time.current - Time.new(1980, 02, 26)) / 1.year.seconds).floor
    visit '/personal_data_sets'
    expect(page).to have_text 'No personal data has been saved yet'
    expect(page).to have_link 'Add personal data'
    expect(page).not_to have_text '39'
    expect(page).not_to have_text 'male'
    expect(page).not_to have_text '185'

    # when
    visit '/personal_data_sets/new'
    fill_in 'personal_data_set[birthday]', with: '02/26/1980'
    fill_in 'personal_data_set[gender]', with: 'male'
    fill_in 'personal_data_set[height]', with: '185'
    click_button 'Submit'

    # then
    expect(page).to have_text 'Personal data successfully recorded'
    visit '/personal_data_sets'
    expect(page).not_to have_text 'No personal data has been saved yet'
    expect(page).not_to have_button 'Add personal data'
    expect(page).to have_text age
    expect(page).to have_text 'male'
    expect(page).to have_text '185'
    expect(page).to have_link 'Edit personal data'
  end
end


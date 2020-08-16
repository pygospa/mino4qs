require 'rails_helper'
require 'support/capybara'

RSpec.describe 'LandingPage', type: :system do
  it 'is shown when root page is called' do
    visit '/'
    expect(page).to have_text "Welcome"
  end
end

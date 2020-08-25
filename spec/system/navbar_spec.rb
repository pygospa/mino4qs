require 'rails_helper'
require 'support/capybara'
include Helpers::UserManagementHelper

RSpec.describe 'Navbar', type: :system do
  let(:navbar_xpath) { "//header/nav[contains(@class, 'navbar')]" }
  let(:user)         { FactoryBot.build :user }

  scenario 'shows "Register" and "Log in" buttons but not "Sign out" when user is not logged in' do
    visit root_path

    within :xpath, navbar_xpath do
      expect(page).to have_link 'Register'
      expect(page).to have_link 'Log in'
      expect(page).to_not have_link 'Log out'
    end
  end

  scenario 'shows "Sign out" button but not "Sign in" and "Register" when user is logged in' do
    given_confirmed_account_for user

    visit root_path
    sign_in user

    within :xpath, navbar_xpath do
      expect(page).to have_link 'Log out'
      expect(page).to_not have_link 'Register'
      expect(page).to_not have_link 'Log in'
    end
  end
end

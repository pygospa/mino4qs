require 'rails_helper'
require 'support/capybara'
require 'capybara/email/rspec'

def login(email, password)
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button "Sign in"
end

RSpec.describe 'Account management', type: :system do
  let(:navbar_xpath)  { "//header/div[contains(@class, 'navbar')]" }
  let(:user_mail)     { "user@example.com" }
  let(:user_password) { "Password1" }

  scenario 'allows new user to sign up for an account' do
    # given
    visit '/'
    expect(page).to have_xpath navbar_xpath

    within :xpath, navbar_xpath do # TODO: Should this really happen in navbar?
      click_on 'Sign up'
    end

    expect(page).to have_current_path('/users/sign_up')
    expect(page).to have_selector('form')

    # when
    fill_in 'user[birthday]', with: '1984-03-10'
    fill_in 'user[height]', with: '1.68'
    fill_in 'user[sex]', with: 'male'
    fill_in 'user[email]', with: user_mail
    fill_in 'user[password]', with: user_password
    fill_in 'user[password_confirmation]', with: user_password
    click_button 'Sign up'
    open_email(user_mail)
    current_email.click_link "Confirm my account"

    # then
    expect(page).to have_current_path '/users/sign_in'
    expect(page).to have_content "Your email address has been successfully confirmed."
  end

  scenario 'allows users with account to log into their account'

  scenario 'allows users with account to enter '
end

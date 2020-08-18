require 'rails_helper'
require 'support/capybara'

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

    # TODO: Should this really happen in navbar?
    within :xpath, navbar_xpath do
      click_on 'Sign up'
    end

    expect(page).to have_current_path('/signup')
    expect(page).to have_selector(form)

    # when
    fill_in 'account[email]', with: user_mail
    fill_in 'account[password]', with: user_password
    fill_in 'account[password_confirmation]', with: user_password
    click_button 'Sign up'
    open_email(user_mail)
    current_email.click_link "Confirm my account"

    # then
    expect(page).to have_current_path '/sign_in'
    expect(page).to have_content "Your email address has been successfully confirmed."

    login user_mail, user_password

    expect(page).to have_content "Signed in successfully"
    expect(page).to be_logged_in()
  end

  scenario 'allows users with account to log into their account'

  scenario 'allows users with account to enter '
end

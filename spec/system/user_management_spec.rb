require 'rails_helper'
require 'support/capybara'
require 'capybara/email/rspec'

RSpec.describe 'Account management', type: :system do
  let(:navbar_xpath) { "//header/div[contains(@class, 'navbar')]" }
  let(:user)         { FactoryBot.build :user }

  scenario 'allows new user to sign up for an account' do
    # when
    visit '/'
    sign_up user
    open_email user.email
    current_email.click_link "Confirm my account"

    # then
    expect(page).to have_current_path '/users/sign_in'
    expect(page).to have_content "Your email address has been successfully confirmed."
  end

  scenario 'does not allow users with unconfirmed account to sign in' do
    # given
    user.save!
    expect(user).to_not be_confirmed

    # when
    visit '/'
    sign_in user

    # then
    expect(page).to have_current_path '/users/sign_in'
    expect(page).to have_content "You have to confirm your email address before continuing"
  end

  scenario 'allows users with confirmed account to log into their account' do
    # given
    user.skip_confirmation!
    user.save!
    expect(user).to be_confirmed

    # when
    visit '/'
    sign_in user

    # then
    expect(page).to have_current_path '/'
    expect(page).to have_content "Signed in successfully"
  end
end

def sign_up(user)
  within(:xpath, navbar_xpath) { click_on 'Sign up' } # TODO: Should this really happen in navbar?
  expect(page).to have_current_path '/users/sign_up'
  fill_in 'user[birthday]', with: user.birthday
  fill_in 'user[height]', with: user.height
  fill_in 'user[sex]', with: user.sex
  fill_in 'user[email]', with: user.email
  fill_in 'user[password]', with: user.password
  fill_in 'user[password_confirmation]', with: user.password
  click_button 'Sign up'
end

def sign_in(user)
  within(:xpath, navbar_xpath) { click_on 'Log in' } # TODO: Should this really happen in navbar?
  expect(page).to have_current_path '/users/sign_in'
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Log in"
end

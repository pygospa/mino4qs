require 'rails_helper'
require 'support/capybara'
require 'capybara/email/rspec'
include Helpers::UserManagementHelper

RSpec.describe 'User management', type: :system do
  let(:navbar_xpath)        { "//header/nav[contains(@class, 'navbar')]" }
  let(:user)                { FactoryBot.build :user }
  let(:email_confirmed)     { 'Your email address has been successfully confirmed.' }
  let(:signed_in)           { 'Signed in successfully' }
  let(:signed_out)          { 'Signed out successfully' }
  let(:not_confirmed)       { 'You have to confirm your email address before continuing' }
  let(:invalid_credentials) { 'Invalid Email or password' }
  let(:last_attempt)        { 'You have one more attempt before your account is locked.' }
  let(:account_is_locked)   { 'Your account is locked.' }
  let(:account_unlocked)    { 'Your account has been unlocked successfully' }

  scenario 'allows new user to sign up for an account' do
    visit root_path
    fill_out_registration_for user
    confirm_account_registration_mail_for user
    expect(page).to have_content email_confirmed
  end

  scenario 'does not allow users with unconfirmed account to sign in' do
    given_unconfirmed_account_for user
    visit root_path
    sign_in user
    expect(page).to have_content not_confirmed
  end

  scenario 'allows users with confirmed account to log into their account' do
    given_confirmed_account_for user
    visit root_path
    sign_in user
    expect(page).to have_content signed_in
  end

  scenario 'locks out user after five failed login attempt and sends out unlocking mail' do
    given_confirmed_account_for user
    visit root_path
    five_failed_login_attempts_for user

    sign_in user
    expect(page).to have_content account_is_locked

    unlock_account_via_email_for user

    sign_in user
    expect(page).to have_content signed_in
  end

  scenario 'allows users to log out after they are done' do
    given_confirmed_account_for user
    visit root_path
    sign_in user
    expect(page).to have_content signed_in
    sign_out user
    expect(page).to have_content signed_out
  end
end

def fill_out_registration_for(user)
  within(:xpath, navbar_xpath) { click_on 'Register' }
  fill_in 'user[birthday]', with: user.birthday
  fill_in 'user[height]', with: user.height
  find("#user_sex_#{user.sex}").click
  fill_in 'user[email]', with: user.email
  fill_in 'user[password]', with: user.password
  fill_in 'user[password_confirmation]', with: user.password
  click_button 'Register'
end

def confirm_account_registration_mail_for(user)
  open_email user.email
  current_email.click_link "Confirm my account"
end

def unlock_account_via_email_for(user)
  open_email user.email
  current_email.click_link "Unlock my account"
  expect(page).to have_content account_unlocked
end

def five_failed_login_attempts_for(user)
  user = generate_wrong_password_for user
  5.times do |i|
    sign_in user
    expect(page).to have_content invalid_credentials if i <= 2
    expect(page).to have_content last_attempt        if i == 3
    expect(page).to have_content account_is_locked   if i == 4
  end
end

def given_unconfirmed_account_for(user)
  user.save!
  expect(user).to_not be_confirmed
end

def generate_wrong_password_for(user)
  wrong_password_user = user.dup
  wrong_password_user.password = "#{user.password}-wrong"
  return wrong_password_user
end

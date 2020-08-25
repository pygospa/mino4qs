module Helpers
  module UserManagementHelper
    def given_confirmed_account_for(user)
      user.skip_confirmation!
      user.save!
      expect(user).to be_confirmed
    end

    def sign_in(user)
      within(:xpath, navbar_xpath) { click_on 'Log in' }
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end

    def sign_out(user)
      within(:xpath, navbar_xpath) { click_on 'Log out' }
    end
  end
end

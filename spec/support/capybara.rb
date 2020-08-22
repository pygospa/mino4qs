require 'capybara/rspec'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'

  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless
  end
end

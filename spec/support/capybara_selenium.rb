require 'capybara/rspec'

selenium_url = "http://selenium_chrome:4444/wd/hub"

Capybara.register_driver :selenium_remote do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(ignore-certificate-errors text-type)},
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: URI.parse(selenium_url),
    desired_capabilities: capabilities)
end

RSpec.configure do |config|
  config.before(:each, type: :system, js: true) do
    driven_by :selenium_remote
    host! "http://test:3001/"
  end
end


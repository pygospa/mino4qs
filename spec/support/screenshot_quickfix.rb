# Workaround for capybara taking blank screenshots:
# https://github.com/mattheworiordan/capybara-screenshot/issues/225

require "action_dispatch/system_testing/test_helpers/setup_and_teardown"
::ActionDispatch::SystemTesting::TestHelpers::SetupAndTeardown.module_eval do
  def before_setup
    super
  end

  def after_teardown
    super
  end
end

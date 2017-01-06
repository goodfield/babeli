ENV['RAILS_ENV'] ||= 'test'
require 'coveralls'
Coveralls.wear!
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'selenium/webdriver'

if ENV['SAUCE_ACCESS_KEY']
  Capybara.register_driver 'sauce' do |app|
    Capybara::Selenium::Driver.new(app,
                                   browser: :remote,
                                   url: "https://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:443/wd/hub",
                                   desired_capabilities: $selenium_capabilities)
  end

  Capybara.default_driver = 'sauce'
  Capybara.javascript_driver = 'sauce'
else
  puts $selenium_capabilities
  Capybara.default_driver = :selenium
end

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include FactoryGirl::Syntax::Methods
  include Warden::Test::Helpers
  include Capybara::DSL

  self.use_transactional_tests = false

  def teardown
    Capybara.reset_sessions!
    Warden.test_reset!
  end

end

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::JUnitReporter.new, Minitest::Reporters::HtmlReporter.new]
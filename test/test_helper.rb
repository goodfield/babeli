ENV['RAILS_ENV'] ||= 'test'
require 'coveralls'
Coveralls.wear!
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'selenium/webdriver'

if ENV['TRAVIS']

  capabilities = {
      :platform => ENV['PLATFORM'],
      :browserName => ENV['BROWSER'],
      :version => ENV['BROWSER_VERSION'],
      'tunnel-identifier'.to_sym => ENV['TRAVIS_JOB_NUMBER'],
      :name => "Travis ##{ENV['TRAVIS_JOB_NUMBER']}"
  }

  url = "https://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:443/wd/hub"

  Capybara.server_port = 8000

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,
                                   browser: :remote,
                                   url: url,
                                   desired_capabilities: capabilities)
  end
end

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include FactoryGirl::Syntax::Methods
  include Warden::Test::Helpers
  include Capybara::DSL

  self.use_transactional_tests = false

  def setup
    Capybara.default_driver = :selenium
  end

  def teardown
    Capybara.reset_sessions!
    Warden.test_reset!
  end

end

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::JUnitReporter.new, Minitest::Reporters::HtmlReporter.new]
ENV['RAILS_ENV'] ||= 'test'
require 'coveralls'
Coveralls.wear!
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

if ENV['SAUCE_ACCESS_KEY']
  require 'sauce'
  require 'sauce/capybara'

  Sauce.config do |config|
    config[:browsers] = [
        ['Windows 10', 'firefox', '50'],
        ['Windows 10', 'chrome', '50'],
        ['Windows 10', 'edge', '14.14393'],
        ['Windows 7', 'internet_explorer', '11.0'],
        ['macOS 10.12', 'safari', '10']
    ]
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
    if ENV['SAUCE_ACCESS_KEY']
      Capybara.default_driver = :sauce
    else
      Capybara.default_driver = :selenium
    end
  end


  def teardown
    Capybara.reset_sessions!
    Warden.test_reset!
  end

end

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::JUnitReporter.new, Minitest::Reporters::HtmlReporter.new]
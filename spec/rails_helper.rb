ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "spec_helper"
require "web_helper"
require "rspec/rails"
require "rspec/json_expectations"
require "capybara/rails"
require "simplecov"

SimpleCov.start

ActiveRecord::Migration.maintain_test_schema!

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.include FactoryGirl::Syntax::Methods
  config.include Warden::Test::Helpers
  config.include Devise::TestHelpers, :type => :controller

  config.before :suite do
    Warden.test_mode!
  end

  config.after :each do
    Warden.test_reset!
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

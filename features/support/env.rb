require 'selenium/webdriver'
require 'capybara/cucumber'

# monkey patch to avoid reset sessions
class Capybara::Selenium::Driver < Capybara::Driver::Base
  def reset!
    @browser.navigate.to('about:blank') if @browser
  end
end

# The BrowserStack SDK intercepts Selenium::WebDriver::Remote::Driver creation
# and supplies the hub URL + capabilities from browserstack.yml. The browser
# option below is a placeholder; the SDK overrides it per platform from the
# `platforms` list in browserstack.yml.
Capybara.register_driver :browserstack do |app|
  options = Selenium::WebDriver::Options.chrome
  Capybara::Selenium::Driver.new(app, browser: :remote, capabilities: options)
end

Capybara.default_driver = :browserstack
Capybara.run_server = false

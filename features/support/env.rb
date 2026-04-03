require 'yaml'
require 'selenium/webdriver'
require 'capybara/cucumber'
require 'browserstack/local'
require 'browserstack/sdk'

# monkey patch to avoid reset sessions
class Capybara::Selenium::Driver < Capybara::Driver::Base
  def reset!
    @browser.navigate.to('about:blank') if @browser
  end
end

Capybara.register_driver :browserstack do |app|
  Capybara::Selenium::Driver.new(app,
    browser: :remote,
    url: "https://hub.browserstack.com/wd/hub")
  # SDK injects credentials, browser caps, build, project, local, etc. automatically
end

Capybara.default_driver = :browserstack
Capybara.run_server = false

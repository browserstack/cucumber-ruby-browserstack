require 'selenium/webdriver'
require 'capybara/cucumber'
require 'browserstack/local'
require 'browserstack-automate'
BrowserStack.for "cucumber"

url = "http://#{ENV['BS_USERNAME']}:#{ENV['BS_AUTHKEY']}@hub.browserstack.com/wd/hub"

Capybara.register_driver :browserstack do |app|
  caps = {
    'bstack:options' => {
    "os" => "OS X",
    "osVersion" => "Catalina",
    "local" => "false",
    "seleniumVersion" => "3.14.0",
    },
    "browserName" => "Safari",
    "browserVersion" => "13.0",
  }    
  browser = 'chrome'
  if(ENV['SELENIUM_BROWSER']) 
	  browser = ENV['SELENIUM_BROWSER'].downcase
  end
  options = Selenium::WebDriver::Options.send(browser)
  options.browser_version = 'latest'

  capabilities = {}
	if ENV['BS_AUTOMATE_OS']
		capabilities['os'] = ENV['BS_AUTOMATE_OS']
		capabilities['osVersion'] = ENV['BS_AUTOMATE_OS_VERSION']
	end

	options.browser_version = ENV['SELENIUM_VERSION'] if ENV['SELENIUM_VERSION']
	capabilities['debug'] = 'true'
	capabilities['sessionName'] = ENV['BS_AUTOMATE_SESSION'] if ENV['BS_AUTOMATE_SESSION']
	capabilities['buildName'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']      
  capabilities['local'] = ENV['BS_AUTOMATE_LOCAL'] || 'false'      
  capabilities['seleniumVersion'] = '4.1.0'
  if capabilities['local'] == 'true';
    @bs_local = BrowserStack::Local.new
    bs_local_args = { "key" => "#{ENV['BS_AUTHKEY']}", "forcelocal" => true }
    @bs_local.start(bs_local_args)
  end
  options.add_option('bstack:options', capabilities)
  Capybara::Selenium::Driver.new(app, :browser => :remote, :url => url, :capabilities => options)
end

Capybara.default_driver = :browserstack
Capybara.app_host = "http://www.google.com"
Capybara.run_server = false

at_exit do
  @bs_local.stop unless @bs_local.nil? 
end

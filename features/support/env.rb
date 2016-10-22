require 'yaml'

Before do
  config = YAML.load_file('./config/single.config.yml') if ENV["TEST_TYPE"].match(/single/)
  config = YAML.load_file('./config/parallel.config.yml') if ENV["TEST_TYPE"].match(/parallel/)
  config = YAML.load_file('./config/local.config.yml') if ENV["TEST_TYPE"].match(/local/)
  index = ENV['TEST_INDEX'].to_i || 0

  username = ENV['BROWSERSTACK_USERNAME'] || config["username"]
  access_key = ENV['BROWSERSTACK_ACCESS_KEY'] || config["access_key"]
  server = config["server"] || "hub-cloud.browserstack.com"
  caps = config["common_caps"].clone
  caps.merge!(config["browser_caps"][index])

  @browser = Selenium::WebDriver.for(
    :remote, :url => "http://#{username}:#{access_key}@#{server}/wd/hub",
    :desired_capabilities => caps)
  @wait = Selenium::WebDriver::Wait.new(:timeout => 60)
end

After do
  @browser.quit
end

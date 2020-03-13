cucumber-browserstack
=====================

This repository provides information and helpful tweaks to run your Cucumber tests on the BrowserStack selenium cloud infrastructure.

###Configuration
Add the CapyBara, Cucumber gems into your Gemfile.
Run `bundle install`.

###Run tests
To run the tests, execute:

```bash
cucumber BS_USERNAME=<username> BS_AUTHKEY=<access-key> SELENIUM_PLATFORM=<platform> SELENIUM_BROWSER=<browser-name>
```
or
```bash
cucumber BS_USERNAME=<username> BS_AUTHKEY=<access-key> BS_AUTOMATE_OS=<os> BS_AUTOMATE_OS_VERSION=<os-version> SELENIUM_BROWSER=<browser-name>
```

Examples:
```bash
cucumber BS_USERNAME=<username> BS_AUTHKEY=<access-key> SELENIUM_PLATFORM=WINDOWS SELENIUM_BROWSER=chrome
```
or
```bash
cucumber BS_USERNAME=<username> BS_AUTHKEY=<access-key> BS_AUTOMATE_OS="OS X" BS_AUTOMATE_OS_VERSION="Mojave" SELENIUM_BROWSER="chrome"
```

Alternatively the variables can be set in the environment using env or your CI framework (like Travis or Jenkins)

Notice that selenium driver.quit is not required for Capybara tests because Capybara implicitly does so.

To run parallel tests use `parallel_cucumber`instead of cucumber. Add the option -n to specify the number of parallel processes. Add the parallel_tests gem in your Gemfile.

To run local testing, set the capability `browserstack.local` in features/support/env.rb to true. 

###Further Reading
- [Cucumber](https://cucumber.io/)
- [CapyBara](http://jnicklas.github.io/capybara/)
- [BrowserStack documentation for Automate](https://www.browserstack.com/automate/ruby)

Happy Testing!



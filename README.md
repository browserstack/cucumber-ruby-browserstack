cucumber-browserstack
=====================

This repository provides information and helpful tweaks to run your Cucumber tests on the BrowserStack selenium cloud infrastructure.

## Setup
* Clone the repo
* Install dependencies `bundle install`
* To test various sample repositories with ease, it is recommended to setup `BROWSERSTACK_USERNAME` and `BROWSERSTACK_ACCESS_KEY` environment variables. Alternatively you can directly update `*.config.yml` files inside the `config/` directory with your [BrowserStack Username and Access Key](https://www.browserstack.com/accounts/settings)

### Running your tests
* To run tests, run `bundle exec rake parallel`
* To run local tests, run `bundle exec rake local`

 Understand how many parallel sessions you need by using our [Parallel Test Calculator](https://www.browserstack.com/automate/parallel-calculator?ref=github)

Alternatively the variables can be set in the environment using env or your CI framework (like Travis or Jenkins)

Notice that selenium driver.quit is not required for Capybara tests because Capybara implicitly does so.

To run parallel tests use `parallel_cucumber`instead of cucumber. Add the option -n to specify the number of parallel processes. Add the parallel_tests gem in your Gemfile.

To run local testing, set the capability `browserstack.local` in config/local.config.yml to true. 

###Further Reading
- [Cucumber](https://cucumber.io/)
- [CapyBara](http://jnicklas.github.io/capybara/)
- [BrowserStack documentation for Automate](https://www.browserstack.com/automate/ruby)

Happy Testing!

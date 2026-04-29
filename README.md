cucumber-browserstack (BrowserStack SDK + Selenium 4)
======================================================

This branch shows how to run Cucumber-Ruby tests on BrowserStack using the [BrowserStack Ruby SDK](https://rubygems.org/gems/browserstack-ruby-sdk) and [Selenium WebDriver 4](https://www.selenium.dev/documentation/webdriver/). The SDK handles capability injection, hub URL, parallelization, and BrowserStack Local for you — you describe platforms once in `browserstack.yml` and run the test command unchanged.

For the legacy Selenium 3 + manual-capability-merge example, see the [`master`](https://github.com/browserstack/cucumber-ruby-browserstack/tree/master) branch.

## Setup
* Clone the repo and check out this branch
* Install dependencies `bundle install`
* To test various sample repositories with ease, it is recommended to setup `BROWSERSTACK_USERNAME` and `BROWSERSTACK_ACCESS_KEY` environment variables. Alternatively you can directly update `userName` and `accessKey` in `browserstack.yml` (and the variants under `config/`) with your [BrowserStack Username and Access Key](https://www.browserstack.com/accounts/settings)

### Running your tests
* To run tests in parallel across 4 browsers, run `bundle exec rake parallel`
* To run a single-platform test, run `bundle exec rake single`
* To run local tests, run `bundle exec rake local`

 Understand how many parallel sessions you need by using our [Parallel Test Calculator](https://www.browserstack.com/automate/parallel-calculator?ref=github)

Alternatively the variables can be set in the environment using env or your CI framework (like Travis or Jenkins)

Notice that selenium driver.quit is not required for Capybara tests because Capybara implicitly does so.

### How the SDK changes things from `master`
- One `browserstack.yml` declares platforms; the SDK picks them up automatically — no per-task `*.config.yml` files in `features/support/env.rb`.
- The SDK runs platforms in parallel for you — no hand-rolled `Parallel.map` loop in the Rakefile.
- The SDK starts and stops BrowserStack Local when `browserstackLocal: true` — no `BrowserStack::Local.new` in `env.rb`.
- The CLI is `bundle exec browserstack-sdk exec cucumber …` — the `rake` tasks shell out to that.

###Further Reading
- [Cucumber](https://cucumber.io/)
- [CapyBara](http://jnicklas.github.io/capybara/)
- [BrowserStack documentation for Automate](https://www.browserstack.com/automate/ruby)
- [BrowserStack Ruby SDK on RubyGems](https://rubygems.org/gems/browserstack-ruby-sdk)

Happy Testing!

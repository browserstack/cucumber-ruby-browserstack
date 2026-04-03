cucumber-browserstack
=====================
![BrowserStack Logo](https://d98b8t1nnulk5.cloudfront.net/production/images/layout/logo-header.png?1469004780)

Code samples to get started with Cucumber tests on BrowserStack Automate using the **BrowserStack Ruby SDK**.

## Setup

### Requirements

1. Ruby: If you don't have Ruby installed, follow the instructions given [here](https://www.ruby-lang.org/en/documentation/installation/)
2. Bundler: If you don't have Bundler installed, follow the instructions given [here](https://bundler.io/)

### Install the dependencies

```sh
bundle install
```

---

## Configuration

### 1. Set up `browserstack.yml`

All BrowserStack configuration is managed through a single `browserstack.yml` file at the root of the repository.

Set parallels.

browserStackLocal: false  # set to true for local testing.
```

## Running your tests

All tests are run from the repo root. The same command is used for all run types — behaviour is controlled entirely by `browserstack.yml`:

```sh
bundle exec browserstack-sdk exec cucumber features/sample.feature
```

> **Tip:** Instead of hardcoding credentials, set `BROWSERSTACK_USERNAME` and `BROWSERSTACK_ACCESS_KEY` as environment variables.

### 2.

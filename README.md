# cucumber-ruby-browserstack
Selenium examples for Cucumber-Ruby and BrowserStack Automate

Edit `browsers.json` to set the list of browsers on which the tests
should be run.

To run the tests, execute:

```bash
rake username=<username> key=<access-key>
```

But with this command, your tests will be run in the browsers one by
one. To speed up the execution, they can be run parallely on different
platforms.

```bash
rake username=<username> key=<access-key> nodes=3
```

This will run 3 tests simultaneously, saving you some time.

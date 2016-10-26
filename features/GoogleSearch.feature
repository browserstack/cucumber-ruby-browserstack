@SingleTest
Feature:
  'When I go to the Google search page, and search for an item,
    I expect to see some reference to that item in the result summary.'

  Scenario:
    Given that I am on the Google Search page
    When I add "BrowserStack" to the search box
    And click the Search Button
    Then the title should be "BrowserStack - Google Search"

@LocalTest
Feature:
  'When I go to the bs-local.com:45691/check page,
    I expect to see "Up and Running" on the page.'

  Scenario:
    When I visit "bs-local.com:45691/check" page
    Then the page should contain the text "Up and Running"

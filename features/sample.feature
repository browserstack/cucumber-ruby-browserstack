Feature: Browserstack test

  Scenario: Can add the product in cart
    Given I visit bstackdemo website
    When I add a product to the cart
    Then I should see same product in cart section

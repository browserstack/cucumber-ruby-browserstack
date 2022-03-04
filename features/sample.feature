Feature: Bstackdemo Add product to cart

Background:
  Given I am on BstackDemo

Scenario: Add Product to cart
  When Click on add to cart button
  Then I should see the cart open and product added to it
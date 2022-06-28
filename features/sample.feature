Feature: Bstackdemo Add product to cart

Background:
  Given I am on https://www.bstackdemo.com/

Scenario: Add Product to cart
  When Click on add to cart button
  Then I should see the cart open and product added to it
  

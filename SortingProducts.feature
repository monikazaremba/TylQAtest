Feature: "Product Sorting" sorted by Price (high to low)


Background: The user is logged in as "standard_user"


Scenario: "Product Sorting" default setting
Given I'm on "https://www.saucedemo.com/inventory.html" page
When I navigate to the "Product Sorting" feature
Then the default "Product Sorting" setting is set on "Name (A to Z)"


Scenario: Sorting products by "price (high to low)"
Given I'm on "https://www.saucedemo.com/inventory.html" page
When I click on the "Product Sorting" dropdown below the "shopping cart" icon
And I select "Price (high to low)"
Then all products in the "inventory containter" are sorted by "price (high to low)"


Scenario: Sorting Products setting after page reload
Given I'm on "https://www.saucedemo.com/inventory.html" page
And "Product Sorting" setting is set by "price (high to low)"
When I refresh the page using browser reload button
Then "Product Sorting" set by "price (high to low)" is removed
And "Product Sorting" is set by default as "Name (A to Z)"

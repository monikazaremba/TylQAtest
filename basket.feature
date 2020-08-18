Feature: Basket


Background: The user is logged in as a "standard_user"


Scenario: Adding first, costliest product to the basket from "inventory container"
Given "Product Sorting" is sorted by "Price (high to low)"
When I navigate to the costliest product in the "inventory container"
And I click "Add to cart" button for this product
Then "Add to cart" button for this product changes the state to "Remove" 
And "1" icon with numbers of products in the basket appears above the "shopping cart" icon


Scenario: Adding second, cheapest product to the basket from "inventory container"
Given "Product Sorting" is sorted by "Price (high to low)"
And I have minimum 1 product (costliest) in the basket
When I navigate to the cheapest product in the "inventory container"
And I click "Add to cart" button for this product
Then "Add to cart" button for this product changes the state to "Remove" 
And "1" icon changes to currently "2" products in the basket above the "shopping cart"


Scenario: Adding any product from the product page
Given I'm on "https://www.saucedemo.com/inventory-item.html?id=5" page
When I click on "Add to cart" button
Then "Add to cart" button for this product changes the state to "Remove" 
And "1" icon with numbers of products in the basket appears above the "shopping cart" icon


Scenario: Opening the basket
Given I'm on "https://www.saucedemo.com/inventory.html" page
When I click on the "shopping cart" icon in the top right corner
Then I'm redirected to the "https://www.saucedemo.com/cart.html"


Scenario: Elements of the basket with no products added
Given I'm on "https://www.saucedemo.com/cart.html" page
And I have no products added to the basket
Then I can see "Your cart" header
And I can see "Qty" column header
And I can see "Description" column header
And I can see "Continue shopping" button
And I can see "Checkout" button


Scenario: Elements of the basket with minimum 1 product added
Given I'm on "https://www.saucedemo.com/cart.html" page
And I have minimum 1 product added to the basket
Then I can see "Your cart" header
And I can see the quantity of the product 
And I can see the "Product name"
And I can see Description of the product
And I can see the price of the product without a currency symbol
And I can see "Remove" button for the product 
And I can see "Continue shopping" button below the list of products
And I can see "Checkout" button below the list of products


Scenario: "Continue shopping" option 
Given I'm on "https://www.saucedemo.com/cart.html" page
When I click "Continue shopping" button
Then I'm redirected to "https://www.saucedemo.com/inventory.html" page


Scenario: Going to Checkout with no products added
Given I'm on "https://www.saucedemo.com/cart.html" page
And I have no products added to my basket
When I click "Checkout" button
Then I'm redirected to "https://www.saucedemo.com/checkout-step-one.html" page



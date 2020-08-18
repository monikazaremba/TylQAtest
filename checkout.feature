Feature: Checkout


Background: The user is logged in as a "standard_user"


Scenario: Redirection from Basket page to Checkout page with minimum 1 product in Basket
Given I'm on "https://www.saucedemo.com/cart.html" page
And I have minimum 1 product added to the basket
When I click "Checkout" button below the list of products
Then I'm redirected to "https://www.saucedemo.com/checkout-step-one.html" page
And I can see "Checkout: Your Information" header
And I can see "First Name" text field
And I can see "Last Name" text field
And I can see "Zip/Postal Code" text field
And I can see "Cancel" button
And I can see "Continue" button


Scenario: Checkout Step 1: Your Information - minimum 1 product in basket, correct personal data
Given I'm on "https://www.saucedemo.com/checkout-step-one.html" page
When I type minimum 1 character into the "First Name" text field
And I type minimum 1 character into the "Last Name" text field
And I type minimum 1 character into the "Zip/Postal Code" text field
And I click "Continue" button
Then I'm redirected to "https://www.saucedemo.com/checkout-step-two.html" page




Scenario: Checkout Step 1: Your Information - empty fields validation
Given I'm on "https://www.saucedemo.com/checkout-step-one.html" page
And I click "Continue" without filling minimum 1 personal text field
Then the error message is displayed
|Text field|      |Validation message|
|First name|      |Error: First Name is required|
|Last name|       |Error: Last Name is required|
|Zip/Postal Code| |Error: Postal Code is required|


Scenario: Checkout Step 1: Your Information - cancelling purchase
Given I'm on "https://www.saucedemo.com/checkout-step-one.html" page
When I click "Cancel" button
Then I'm redirected to "https://www.saucedemo.com/cart.html" page


Scenario: Checkout Step 1: Your Information - with no products added, correct personal data
Given I'm on "https://www.saucedemo.com/checkout-step-one.html" page
And I have no products added to my basket
When I type minimum 1 character into the "First Name" text field
And I type minimum 1 character into the "Last Name" text field
And I type minimum 1 character into the "Zip/Postal Code" text field
And I click "Continue" button
Then I'm redirected to "https://www.saucedemo.com/checkout-step-two.html" page
Then I'm redirected to "https://www.saucedemo.com/checkout-complete.html" page
And I can see "Finish" header
And I can see the message "THANK YOU FOR YOUR ORDER. Your order has been dispatched, and will arrive just as fast as the pony can get there!"
And I can see "https://www.saucedemo.com/img/pony-express.png" image

Scenario: Checkout Step 2: Overview - elements of the Overview page
Given I'm on "https://www.saucedemo.com/checkout-step-one.html" page
And I have minimum 1 product in the basket
When I click "Continue"
Then I'm redirected to "https://www.saucedemo.com/checkout-step-two.html" page
And I can see "Checkout: Overview" header
And I can see product/s "Quantity" data
And I can see product/s "Description" data
And I can see product/s "price" with currency symbol added
And I can see "Payment Information" section
And I can see "Shipping Information" section
And I can see "Item total" price
And I can see "Tax" price
And I can see "Total" price
And I can see "Cancel" button
And I can see "Finish" button


Scenario: Checkout Finish page
Given I'm on "https://www.saucedemo.com/checkout-step-two.html" page
When I click "Finish" button in the bottom right corner 
Then I'm redirected to "https://www.saucedemo.com/checkout-complete.html" page
And I can see "Finish" header
And I can see the message "THANK YOU FOR YOUR ORDER. Your order has been dispatched, and will arrive just as fast as the pony can get there!"
And I can see "https://www.saucedemo.com/img/pony-express.png" image


Scenario: Checkout Step 2: Overview - cancelling purchase 
Given I'm on "https://www.saucedemo.com/checkout-step-two.html" page
When I click "Cancel" button in the bottom left corner
Then I'm redirected to "https://www.saucedemo.com/inventory.html" page


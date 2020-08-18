Feature: User login


Background: Accepted usernames are:
standard_user
locked_out_user
problem_user
performance_glitch_user


Scenario: Validation for "Username" and "Password" text field
Given I'm on the "https://www.saucedemo.com/" page
When I leave "Username" text field empty
And I leave "Password" text field empty
Then error message is displayed "Epic sadface: Username is required"


Scenario: Validation for "Password" text field
Given I'm on the "https://www.saucedemo.com/" page
When I type "standard_user" in the "Username" text field
And I leave "Password" text field empty
Then error message is displayed Epic sadface: Password is required


Scenario: Username is not on the list of accepted usernames
Given I'm on the "https://www.saucedemo.com/" page
When I type "anonymous" into "Username" text field
And I type correct password "secret_sauce" in the "Password" text field
And I click "Login" button
Then the error message is displayed "Epic sadface: Username and password do not match any user in this service"


Scenario: Log in as "standard_user" with incorrect password
Given I'm on the "https://www.saucedemo.com/" page
When I type "standard_user" into "Username" text field
And I type incorrect password "test" in the "Password" text field
And I click "Login" button
Then the error message is displayed "Epic sadface: Username and password do not match any user in this service"


Scenario: Log in as "standard_user" with correct password
Given I'm on the "https://www.saucedemo.com/" page
When I type "standard_user" into "Username" text field
And I type correct password "secret_sauce" in the "Password" text field
And I click "Login" button
Then I'm redirected to "https://www.saucedemo.com/inventory.html" as a logged in user








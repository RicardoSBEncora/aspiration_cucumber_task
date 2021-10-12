Feature: Products Page

  Background: As a User I go to products page
    Given I go to Aspiration.com home page
    When I click on Spend & Save on navigation bar

  Scenario: Verify that as a user I can go to products and prices page
    Then I can see plans and prices on the product page

  Scenario: Verify I can see Aspiration and Aspiration Plus card products
    Then I can see Aspiration card
    And I can see Aspiration Plus card

  Scenario: Verify I can see sign up modal when clicking Get Aspiration
    And I click on Get Aspiration button
    Then I can see the aspiration sign up modal appear

  Scenario: Verify I can see Aspiration Plus monthly and yearly plans modal
    And I click on Get Aspiration Plus button
    Then I can see the aspiration plus modal appear
    And I can see yearly radio option is $71.88 paid once yearly
    And I can see monthly radio option is $7.99 paid monthly

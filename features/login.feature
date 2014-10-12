Feature: User Authentication
  As a site manager
  I want admins to log in
  So that they can access CUD operations

  Scenario: Successful Login
    Given I am on the login page
    When I enter my password
    And I click log in
    Then I see the welcome message
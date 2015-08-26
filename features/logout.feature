@user
Feature: Log out user
  As a user
  I want to log out
  So that my account in secure

  Scenario: Log out
    Given I am logged in
    When I click on "Log Out"
    Then I should be redirected to the log out page
    And  not see the 'log out' link

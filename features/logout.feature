@user @authentication @logout
Feature: Log out user
  As a user
  I want to log out
  So that my account in secure

  Scenario Outline: Log out
    Given I have a confirmed account for email <email>
    Given I sign in as <email>
    When I click on "Log Out"
    Then I should be on the /users/sign_in page
    And  not see the "log out" link

    Scenarios: Successful sign out
      | email         |
      | test@test.com |
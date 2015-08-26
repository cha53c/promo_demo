@user @authentication
Feature: Log out user
  As a user
  I want to log out
  So that my account in secure

  Scenario Outline: Log out
    Given <email> is signed in
    When I click on "Log Out"
    Then I should be redirected to "/"
    And  not see the "log out" link

    Scenarios: Successful sign out
      | email |
      | test@test.com |
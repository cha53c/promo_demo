@user @authentication
Feature: User Authentication
  As a user
  I want to log in
  So that they can access my account

  Scenario Outline: Login

    Given I visit users/sign_in
    Given I have a confirmed account with email <email>
    Given email <email> and password <password>
    When I click on "Sign in"
    Then I see <message> message

    Scenarios: Correct email and password
     | email | password | message |
     | test@test.com | 12345678   | Signed in successfully. |

    Scenarios: Incorrect password
      | email| password | message |
      | test@test.com| invalid_pass | Invalid email or password |


    Scenarios: No password
      | email         | password | message |
      | test@test.com | nil      | Invalid email or password |

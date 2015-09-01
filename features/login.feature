@user @authentication @login
Feature: User Authentication
  As a user
  I want to log in
  So that they can manage my account

  Scenario Outline: Login
    Given I visit users/sign_in
    Given I have a confirmed account with email <email>
    Given I fill in <email> and <password>
    When I click on "Sign in"
    Then I see <message> message

    Scenarios: Correct email and password
     | email         | password   | message |
     | test@test.com | 12345678   | Signed in successfully. |

    Scenarios: Incorrect password
      | email        | password     | message |
      | test@test.com| invalid_pass | Invalid email or password |


    Scenarios: No password
      | email         | password | message |
      | test@test.com | nil      | Invalid email or password |

  Scenario: First Time Sign In
    Given I signed is as test@test.com
    Then I should be on the /clients/new page

  Scenario:

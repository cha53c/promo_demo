@user @authentication @login
Feature: User Authentication
  As a user
  I want to log in
  So that they can manage my account

  Scenario Outline: Login
    Given I visit users/sign_in
    Given I have a confirmed account for email <email>
    Given I fill in <email> and <password>
    When I click on "Sign in"
    Then I see <message> message

    Scenarios: Correct email and password
     | email         | password   | message |
     | test@cucumbers.com | 12345678   | Signed in successfully. |

    Scenarios: Incorrect password
      | email        | password     | message |
      | test@cucumbers.com| invalid_pass | Invalid email or password |


    Scenarios: No password
      | email         | password | message |
      | test@cucumbers.com | nil      | Invalid email or password |

  Scenario: First Time Sign In
    Given I have a confirmed account for email test@cucumbers.com
    Given I sign in as test@cucumbers.com
    Then I should be on the /clients/new page

  Scenario: Sign In after saved promoters details
    Given I have a confirmed account for email test@cucumbers.com
    Given I saved my promoters details for test@cucumbers.com
    Given I sign in as test@cucumbers.com
    Then I should be on my promoters details page for test@cucumbers.com
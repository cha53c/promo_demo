@user
Feature: User Authentication
  As a user
  I want to log in
  So that they can access my account

  Scenario Outline: Login
    Given email <email> and password <password>
    When I click on "Sign In"
    Then I see <message> message

    Scenarios: correct email and password
     | email | password | message |
     | test@test.com | abc123   | Welcome! You are logged in |

    Scenarios: Incorrect password
      | email| password | message |
      | test@test.com| 123456   | Invalid email or password |


    Scenarios: No password
      | email         | password | message |
      | test@test.com | nil      | Invalid email or password |

#     Scenarios: No email
#       | email         | password | message |
#       | nil | abc123      | "Invalid Username or Password" |
@done @admin
Feature: User Authentication
  As a site manager
  I want admins to log in
  So that they can access CUD operations

  Scenario Outline: Login
    Given email <email> and password <password>
    When I click on sign in
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
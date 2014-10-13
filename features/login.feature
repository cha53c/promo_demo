Feature: User Authentication
  As a site manager
  I want admins to log in
  So that they can access CUD operations

  Scenario Outline: Login
    Given password <password>
    When I click on sign in
    Then I see <message> message

    Scenarios: correct password
      | password | message |
      | abc123   | Welcome |

    Scenarios: Incorrect password
      | password | message |
      | 123456   | "Invalid Username or Password" |

    Scenarios: No password
      | password | message |
      | nil      | "Invalid Username or Password" |

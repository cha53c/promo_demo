Feature: Add Client
  As a Admin
  I want to able to add new clients
  So that they can promote on our site

  Scenario:Successfully add a client
    Given I am logged in
    And I am on the new client page
    When I enter the client details
    Then I should see the client in the list of clients
    And I should see the client successfully added message

#    Scenario Outline:
#        Given
#        When
#        Then

 #       Scenarios:
 #       | var1 | var2 |
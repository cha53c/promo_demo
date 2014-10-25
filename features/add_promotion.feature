Feature: Add Promotions
  As a Admin
  I want to be able to add new promotions
  So that clients can promote on the site

  Scenario: Successfully add a promotion
    Given I am logged in
    And I am on the new promotion page for a client
    When I submit the details
    Then  I should see the new promotion
    And see success message

#    Scenario Outline:
#        Given
#        When
#        Then

 #       Scenarios:
 #       | var1 | var2 |
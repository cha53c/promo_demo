@save_details
Feature: Promoter can add an address to their promoter details
  As a Promoter
  I want add my address details
  So that that they can be found by customers
    
  Scenario: Save address details
    Given I am signed in and have previously saved details for test@cucumbers.com
    And I click on "Edit"
    When I fill in address with House 1, Broad Street
    And I click on "Save Details"
    Then I should be on my promoters details page for test@cucumbers.com
    And I should see House 1
    
#    Scenario Outline:
#        Given
#        When
#        Then
        
 #       Scenarios:
 #       | var1 | var2 |
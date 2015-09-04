@admin @authorisation
Feature:
  As an Administrator
  I want to view all users
  So that I can manage them
    
  Scenario:
    Given I have an admin account for cucumber@test.com
    And I sign in as cucumber@test.com
    When I visit /users
    Then I should see 'Users'
    And  I should see 'Status Overview'


#    Scenario Outline:
#        Given
#        When
#        Then
        
 #       Scenarios:
 #       | var1 | var2 |
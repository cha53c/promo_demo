@admin
Feature:
    As an admin
    I want to be able to view all users on one page
    So that create, update and delete users
    
    Scenario: View user management page
        Given I have an admin account for admin@test.com
        And I sign in as admin@test.com
        When I visit /users
        Then I should see 'Status Overview'
        And should have data for admin user
    
#    Scenario Outline:
#        Given
#        When
#        Then
        
 #       Scenarios:
 #       | var1 | var2 |
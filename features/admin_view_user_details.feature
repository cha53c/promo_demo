@admin @user_details
Feature:
  As an Admin
  I want to view a users details
  So that I can manage user queries
    
  Scenario: View user details
    Given I have an admin account for admin@test.com
    And I sign in as admin@test.com
    Given user pepino@test.com exists
    Given I am on the user details page for pepino@test.com
    Then I should see 'User Details'
    And I should see 'pepino@test.com'
    And I should see Admin only links
    And I should see User Audit data
    And  I should not see 'Edit'

#    Scenario Outline:
#        Given
#        When
#        Then
        
 #       Scenarios:
 #       | var1 | var2 |
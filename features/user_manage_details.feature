@user @user_details
Feature:
  As a user
  I want to be able to view and edit my details
  So that I can keep them up to date

  Scenario: View my user details
    Given I have a confirmed account for email cucumber@test.com
    Given I sign in as cucumber@test.com
    When I click on "cucumber@test.com"
    And I click on "Personal Details"
    Then I should be on the user details page for user cucumber@test.com
    And I should see 'Edit'
    And I should not see 'Delete'

  Scenario: Edit my user details
    Given I have a confirmed account for email cucumber@test.com
    Given I sign in as cucumber@test.com
    And I am on edit user details page for cucumber@test.com
    And I change the user_name field to Bob
    Then I fill in my current password
    Then I click on "Save Changes"
    Then I should be on the user details page for user cucumber@test.com
    And I should see 'Bob' in field user_name

  Scenario: Change my password
    Given
    When
    Then

  Scenario: Change my email
    Given
    When
    Then
    
#    Scenario Outline:
#        Given
#        When
#        Then
        
 #       Scenarios:
 #       | var1 | var2 |
@admin @authorisation
Feature:
  As a administrator
  I want to view the summary page
  So that I can manage the application
    # TODO do I still want to have a summary page?
  Scenario:
    Given I am signed in as role "admin"
    When I visit 'summary page'
    Then I should see 'summary information'
    
#    Scenario Outline:
#        Given
#        When
#        Then
        
 #       Scenarios:
 #       | var1 | var2 |
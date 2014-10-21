Feature: Log out user
  As a site manager
  I want admins to log out
  So that they can view the site as a visitor

  Scenario: Log out
    Given I am logged in
    When I click on 'log out'
    Then I should be redirected to the 'home page'
    And  not see the 'log out' link

#    Scenarios: logged in user
#    | var1 | var2 |
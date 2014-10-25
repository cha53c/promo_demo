@done @visitor @search
Feature: Keyword search
  As a Visitor
  I want to search for promotions using a keyword
  So that I can find promotions I am interested in

  Scenario: Successful keyword search
    Given I am on the home page
    When I enter a word for an existing promotion
    Then I should see all the promotions with that word

#    Scenario Outline:
#        Given
#        When
#        Then

 #       Scenarios:
 #       | var1 | var2 |
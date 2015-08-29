@visitor @search
Feature: Keyword search
  As a Visitor
  I want to search for promotions using a keyword
  So that I can find promotions I am interested in

  Scenario: Successful keyword search
    Given I visit /
    Given The promotion exists
    When I search for 'Burger'
    Then I should see promotions with 'Burger'

  Scenario: No results keyword search
    Given a keyword
    When I search
    Then I should see the message 'No results Found'

#    Scenario Outline:
#        Given
#        When
#        Then

 #       Scenarios:
 #       | var1 | var2 |
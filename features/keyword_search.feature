@visitor @search
Feature: Keyword search
  As a Visitor
  I want to search for promotions using a keyword
  So that I can find ALL promotions with the keyword

  Scenario: Successful keyword search
    Given I visit /
    Given The promotion exists
    When I search for 'Burger'
    Then I should see promotions with 'Burger'

  Scenario: No results keyword search
    Given I visit /
    When I search for 'Burger'
    Then I see No results found message

#    Scenario Outline:
#        Given
#        When
#        Then

 #       Scenarios:
 #       | var1 | var2 |
@user
Feature: Register User
  As a User
  I want to register for an account
  So that I can access the site
    
#
    
   Scenario Outline: Registration
     Given I am on the Sign Up page
     When  I fill in email <email> and password <password>
     And I click on Sign Up
     Then I see <message> message
     Then I receive an 'email confirmation' email
        
    Scenarios: Valid registration
      | email | password | message |
      | test@test.com | abc12345   | A message with a confirmation link has been sent to your email address. Please follow the link to activate your account. |

#     TODO add scenario for unconfirmed passed
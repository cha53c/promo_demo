@user @authentication
Feature: Register User
  As a User
  I want to register for an account
  So that I can create promotions

   Scenario Outline: Registration
     Given I visit users/sign_up
     When  I fill in sign up credentials <name>, <email>, <password>
     And I click on "Sign Up"
     Then I see <message> message
     Then I receive an 'email confirmation' in <email>
     #  TODO I want this to go to the sign in page after clicking the link
     Then I click on "Confirm my account" link in email
       And I see Your email address has been successfully confirmed. message
        
    Scenarios: Valid registration
      | name   |email         | password   | message |
      | Pepino |test@test.com | abc12345   | A message with a confirmation link has been sent to your email address. Please follow the link to activate your account. |

#     TODO add scenario for unconfirmed password
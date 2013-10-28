Feature: user sign up
  As a user
  So that I can create an account
  I want to be able to sign up for Ronde

Background:
  Given We are on the sign up page

Scenario: sign up with Ronde
  When I fill in "user_email" with "joejohn@example.com"
  And I fill in "user_phone_number" with "8055555555"
  And I fill in "user_first_name" with "Joe"
  And I fill in "user_last_name" with "John"
  And I fill in "user_password" with "yahtzee12"
  And I fill in "user_password_confirmation" with "yahtzee12"
  Then I click "Sign up"
  Then We should be on the tour page

Scenario: can't sign up with missing email (sad path)
  And I fill in "user_phone_number" with "8055555555"
  And I fill in "user_first_name" with "Joe"
  And I fill in "user_last_name" with "John"
  And I fill in "user_password" with "yahtzee12"
  And I fill in "user_password_confirmation" with "yahtzee12"
  Then I click "Sign up"
  Then We should be on the users page
  And I should see "Email can't be blank"

Scenario: can't sign up with missing first name (sad path)
  When I fill in "user_email" with "john@example.com"
  And I fill in "user_phone_number" with "8055555555"
  And I fill in "user_last_name" with "John"
  And I fill in "user_password" with "yahtzee12"
  And I fill in "user_password_confirmation" with "yahtzee12"
  Then I click "Sign up"
  Then We should be on the users page
  And I should see "First name can't be blank"

Scenario: can't sign up with missing last name (sad path)
  When I fill in "user_email" with "joe@example.com"
  And I fill in "user_phone_number" with "8055555555"
  And I fill in "user_first_name" with "Joe"
  And I fill in "user_password" with "yahtzee12"
  And I fill in "user_password_confirmation" with "yahtzee12"
  Then I click "Sign up"
  Then We should be on the users page
  And I should see "Last name can't be blank"

Scenario: can't sign up with missing password (sad path)
  When I fill in "user_email" with "jj@example.com"
  And I fill in "user_phone_number" with "8055555555"
  And I fill in "user_first_name" with "Joe"
  And I fill in "user_last_name" with "John"
  And I fill in "user_password_confirmation" with "yahtzee12"
  Then I click "Sign up"
  Then We should be on the users page
  And I should see "Password can't be blank"
  And I should see "Password doesn't match confirmation"

Scenario: can't sign up with missing password confirmation (sad path)
  When I fill in "user_email" with "joejohn@example.com"
  And I fill in "user_phone_number" with "8055555555"
  And I fill in "user_first_name" with "Joe"
  And I fill in "user_last_name" with "John"
  And I fill in "user_password_confirmation" with "yahtzee12"
  Then I click "Sign up"
  Then We should be on the users page
  And I should see "Password doesn't match confirmation"

Scenario: can't sign up with invalid phone number (sad path)
  When I fill in "user_email" with "joejohn@example.com"
  And I fill in "user_phone_number" with "811321456"
  And I fill in "user_first_name" with "Joe"
  And I fill in "user_last_name" with "John"
  And I fill in "user_password" with "yahtzee12"
  And I fill in "user_password_confirmation" with "yahtzee12"
  Then I click "Sign up"
  Then We should be on the users page
  And I should see "Phone number is invalid"

Scenario: can't sign up when passwords don't match (sad path)
  When I fill in "user_email" with "joejohn@example.com"
  And I fill in "user_phone_number" with "8055555555"
  And I fill in "user_first_name" with "Joe"
  And I fill in "user_last_name" with "John"
  And I fill in "user_password" with "yahtzee12"
  And I fill in "user_password_confirmation" with "yahtzee11"
  Then I click "Sign up"
  Then We should be on the users page
  And I should see "Password doesn't match confirmation"

Scenario: too few chars
  When I fill in "user_email" with "joejohn@example.com"
  And I fill in "user_phone_number" with "8055555555"
  And I fill in "user_first_name" with "Joe"
  And I fill in "user_last_name" with "John"
  And I fill in "user_password" with "yacht"
  And I fill in "user_password_confirmation" with "yacht"
  Then I click "Sign up"
  Then We should be on the users page
  And I should see "Password is too short (minimum is 8 characters)"

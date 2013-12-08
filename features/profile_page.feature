Feature: profile page
  As a user
  So I know my info and can change my info
  I want to see my profile page and edit my profile

Background: I am visiting the website for the first time this session

	Given We are on the sign up page
	When I fill in "user_email" with "joejohn@example.com"
  	And I fill in "user_phone_number" with "8055555555"
  	And I fill in "user_first_name" with "Joe"
  	And I fill in "user_last_name" with "John"
  	And I fill in "user_password" with "yahtzee12"
  	And I fill in "user_password_confirmation" with "yahtzee12"
  	Then I click "Sign up"
  	Then We should be on the tour page
	Then I am on the ronde dashboard
	And I should see "Joe"
	Then I follow "logout"
	And I should see "sign up"
	And I should see "sign in"
	Then I follow "Sign In"
	When I fill in "joejohn@example.com" for "Email"
	When I fill in "yahtzee12" for "Password"
	When I press "Sign in" 
	Then I should see "Joe"
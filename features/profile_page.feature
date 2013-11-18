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
	Then I follow "home"
	And I should see "Joe"
	Then I follow "logout"
	And I should see "sign up"
	And I should see "sign in"
	Then I follow "Sign In"
	When I fill in "joejohn@example.com" for "Email"
	When I fill in "yahtzee12" for "Password"
	When I press "Sign in" 
	Then I should see "Joe"

Scenario: I can view my own profile and edit it
	Then I should see "profile"
	When I follow "edit profile"
	Then I should see "Edit"
	# Then I should see "Name:"
	# Then I should see "Joe John"
	# Then I should see "Phone Number: 8055555555"
	# Then I should see "Email: joejohn@example.com"
	# Then I should see "Friends:"
	# Then I should see "Edit"
	# Then I should see "sign out"
	# Then I should see "home"
	# When I follow "Edit"
	# Then I should see "Edit User"
	Then I should see "Password confirmation"
	When I follow "Back"
	# Then I should see "Profile Page"
	Then I should see "profile"
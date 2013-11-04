Feature: Send a friend request
	As a user
	I want to be able to send a friend request
	So that I can see my friends' events


Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Scenario: Sending a friend request to a friend that exists
	Given I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the profile page for user with id 1
	When I follow "My Friends"
	And I fill in ":friend_search" with "SondeFirst"
	And I press "Search"
	Then I should see "SondeFirst"
	When I press "Add Friend"
	Then I should see "Friend Request Successful"

Scenario: Sending a friend request to a friend that does not exist
	Given I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the dashboard for user with id 1
	When I follow "My Friends"
	And I fill in ":friend_search" with "GondeFirst"
	And I press "Search"
	Then I should see "Sorry, GondeFirst is not a Ronde user."

Feature: Accept a friend request
	As a user
	I want to be able to accept a friend request
	So that my friend can see my events

Scenario: Accept a friend request from a list of pending friends
	Given "SondeFirst" has sent a friend request to "RondeFirst"
	And I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the dashboard for user with id 1
	When I press "Friend Requests"
	Then I should see "SondeFirst"
	When I press "Accept Friend"
	Then I should see "Congratulations, you and SondeFirst are now friends."
	When I follow "Friends"
	Then I should see "SondeFirst"

Feature: Reject a friend request

Scenario: Reject a friend request from a list of pending friends
	Given "SondeFirst" has sent a friend request to "RondeFirst"
	And I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the dashboard for user with id 1
	When I press "Friend Requests"
	Then I should see "SondeFirst"
	When I press "Reject Friend"
	Then I should see "You have rejected SondeFirst as a friend."
	And I should not see "SondeFirst"

Feature: See friend requests
	
Scenario: See a list of pending friends
	Given "SondeFirst" has sent a friend request to "RondeFirst"
	And I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the dashboard for user with id 1
	When I press "Friend Requests"
	Then I should see "SondeFirst"
	
Scenario: Should not see friend in pending friends if I have already accepted them
	Given "SondeFirst" has sent a friend request to "RondeFirst"
	And I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the dashboard for user with id 1
	And I have accepted my friend request from "SondeFirst"
	When I press "Friend Requests"
	Then I should not see "SondeFirst"

Feature: See friends

Scenario: See a list of accepted friends
	Given "SondeFirst" and "RondeFirst" are friends
	And I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the dashboard for user with id 1
	When I follow "My Friends"
	Then I should see "SondeFirst"

Scenario: Should not see pending friend requests in my friends
	Given "SondeFirst" has sent a friend request to "RondeFirst"
	And I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the dashboard for user with id 1
	When I follow "My Friends"
	Then I should not see "SondeFirst"

Scenario: Should not see rejected friend requests in my friends
	Given "SondeFirst" has sent a friend request to "RondeFirst"
	And I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the dashboard for user with id 1
	When I press "Friend Requests"
	Then I should see "SondeFirst"
	When I press "Reject Friend"
	Then I should see "You have rejected SondeFirst as a friend."
	And I should not see "SondeFirst"
	When I follow "Friends"
	Then I should not see "SondeFirst"

Feature: Unfriend someone

Scenario: Unfriend an accepted friend
	Given "SondeFirst" and "RondeFirst" are friends
	And I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the dashboard for user with id 1
	When I follow "My Friends"
	Then I should see "SondeFirst"
	When I press "Remove Friend"
	Then I should see "You have removed SondeFirst as a friend."
	And I should not see "SondeFirst"
	





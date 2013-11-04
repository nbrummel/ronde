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








	





Feature: See friends

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

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
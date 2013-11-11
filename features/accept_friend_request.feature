Feature: Accept a friend request
	As a user
	I want to be able to accept a friend request
	So that my friend can see my events

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Scenario: Accept a friend request from a list of pending friends
	Given "SondeFirst" has sent a friend request to "RondeFirst"
	And I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the dashboard for user with id 1
	When I follow "friends"
	Then I should see "SondeFirst"
	When I press "✓"
	Then I should see "Congratulations, you and SondeFirst are now friends."
	When I follow "Friends"
	Then I should see "SondeFirst"
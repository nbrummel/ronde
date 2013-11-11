Feature: Unfriend someone

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Scenario: Unfriend an accepted friend
	Given "SondeFirst" and "RondeFirst" are friends
	And I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the dashboard for user with id 1
	When I follow "friends"
	Then I should see "SondeFirst"
	When I click on "x"
	Then I should not see "SondeFirst"
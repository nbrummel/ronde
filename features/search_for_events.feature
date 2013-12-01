Feature:
	As a user
	I want to use the search bar to search for events
	So I can find my friends' events

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Given "RondeFirst" and "SondeFirst" are friends

Scenario: See friends' created events
	Given I am logged in as user "ronde@gmail.com" with password "RondePassword"
	And I have created an event called "Basketball" as user "RondeFirst" to invite friend "SondeFirst"
	And I search for "Basketball"
	Then I should see "Basketball"
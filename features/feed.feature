Feature:
	As a user
	I want to have a feed of ronde events on my dashboard
	So I can see my friends' recently created events

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Given "RondeFirst" and "SondeFirst" are friends

Scenario: Seeing events on the feed
	Given I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I have created an event called "Basketball" as user "RondeFirst" to invite friend "SondeFirst"
	And I have signed out
	And I am logged in as "sonde@gmail.com" with password "SondePassword"
	And I am on the ronde "home" page
	Then I should see "Basketball"
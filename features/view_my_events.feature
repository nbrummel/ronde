# need to add

Feature:
	As a user
	I want to be able to view events I have created
	So I can keep track of events I've created

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Given "RondeFirst" and "SondeFirst" are friends

Scenario: Viewing a created event
	Given I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I have created an event called "Blorg" as user "RondeFirst" to invite friend "SondeFirst"
	And I am on the ronde dashboard
	When I follow "all_events"
	Then I should see "Blorg"

Scenario: Viewing a created event in "Created" tab
	Given I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I have created an event called "Blorg" as user "RondeFirst" to invite friend "SondeFirst"
	And I am on the ronde dashboard
	When I follow "all_events"
	And I follow "created"
	Then I should see "Blorg"




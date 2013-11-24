# need to add

Feature:
	As a user
	I want to be able to view events I have created
	So I can keep track of events I've created

	Given the following users exist:
	| email           | first_name | last_name | phone_number | password      |
	| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
	| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

	Given the following events exist:
	| description		| location		| name 		| start		| created_by 	| day		|
	| Tuesday Lunch 	| Chipotle		| lunch		| 12:00 PM 	| RondeFirst	| Tuesday 	|

Scenario: Viewing a created event
	Given I am logged in as RondeFirst
	Given I am on the ronde dashboard
	And I click "all events"
	Then I should see "Tuesday Lunch"
	When I press "Tuesday Lunch"
	Then I should see "Chipotle"
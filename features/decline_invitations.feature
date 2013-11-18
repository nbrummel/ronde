Feature:
	As a user
	I want to be able to decline my friend's invitations
	So friend's know I cannot attend

Background:

	Given the following users exist:
	| email           | first_name | last_name | phone_number | password      |
	| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
	| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

	Given "RondeFirst" and "SondeFirst" are friends

	Given the following events exist:
	| description		| location		| name 		| start		| created_by 	| day		|
	| Tuesday Lunch 	| Chipotle		| lunch		| 12:00 PM 	| RondeFirst	| Tuesday 	|

Scenario: Inviting friends to events
	Given I am logged in as RondeFirst
	And I am on the ronde dashboard
	When I follow "all events"
	Then I should see "Tuesday Lunch"
	When I follow "Tuesday Lunch"
	And I press "Invite Friends"
	Then I should see "SondeFirst"
	When I invite "SondeFirst"
	Then I should see "Invitations sent!"

Scenario: Accepting invitations
	Given "RondeFirst" invited "SondeFirst" to "Tuesday Lunch"
	And I am logged in as SondeFirst
	And I am on the ronde dashboard
	When I follow "invitations"
	Then I should see "Tuesday Lunch by RondeFirst RondeLast"
	When I press "decline"
	And I press "Cancel"
	When I follow "all events"
	Then I should not see "Tuesday Lunch"
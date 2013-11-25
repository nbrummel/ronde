Feature: Events
	As a user
	So I can meet with friends
	I want to be able to invite my friends to events

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Given "RondeFirst" and "SondeFirst" are friends

Scenario: Invite friend to event through all_events
	Given I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I have created an event called "Blorg" as user "RondeFirst" to invite friend "SondeFirst"
	And I have signed out
	And I am logged in as "sonde@gmail.com" with password "SondePassword" 
	And I am on the ronde dashboard
	When I follow "all_events"
	And I follow "invited"
	Then I should see "Blorg"

Scenario: Invite friend to event through invitations
	Given I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I have created an event called "Blorg" as user "RondeFirst" to invite friend "SondeFirst"
	And I have signed out
	And I am logged in as "sonde@gmail.com" with password "SondePassword" 
	And I am on the ronde dashboard
	When I follow "invitations"
	Then I should see "Blorg"
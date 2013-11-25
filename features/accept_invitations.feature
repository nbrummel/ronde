Feature:
	As a user
	I want to be able to accept friend's invitations
	So I can do stuff with friends

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Given "RondeFirst" and "SondeFirst" are friends

Scenario: Accept invitation through all events
	Given I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I have created an event called "Blorg" as user "RondeFirst" to invite friend "SondeFirst"
	And I have signed out
	And I am logged in as "sonde@gmail.com" with password "SondePassword" 
	And I am on the ronde dashboard
	When I follow "all_events"
	And I follow "invited"
	Then I should see "Blorg"
	When I follow "Blorg"
	And I follow "Invitations"
	Then I follow "accept"
	When I am on the ronde dashboard
	Then I follow "all_events"
	Then I should see "Blorg"

Scenario: Accept invitation through invitations
	Given I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I have created an event called "Blorg" as user "RondeFirst" to invite friend "SondeFirst"
	And I have signed out
	And I am logged in as "sonde@gmail.com" with password "SondePassword" 
	And I am on the ronde dashboard
	And I follow "invitations"
	Then I follow "accept"
	When I am on the ronde dashboard
	Then I follow "all_events"
	Then I should see "Blorg"
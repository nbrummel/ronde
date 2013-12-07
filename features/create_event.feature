Feature: Events
	As a user
	So I can meet with friends
	I want to be able to create an event


	Given the following users exist:
	| email           | first_name | last_name | phone_number | password      |
	| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
	| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

	Background:
		Given I have signed up as Sonde
		Given I have signed out
		Given I have signed up as Ronde
		Given I have signed out
@javascript
Scenario: Creating a new Event
	Given I am logged in as user SondeFirst
	Given I am on the ronde dashboard
	Then I should see "new event"
	And I click the "new_event" link
	And I fill in "@event[name]" with "49ers Party"
	And I fill in "event[location]" with "My house"
	And I fill in the "event[start]" with "12:00 PM"
	And I fill in the "event[end]" with "1:00 PM"
	And I fill in "event[event_type]" with "other"
	And I fill in "event[description]" with "Beat the Shehawks"
	And I press "Create"
	Then I should be on the page for that event
	And I should see "49ers Party"

Scenario: Invalid Name
	Given I am logged in as user SondeFirst
	Given I am on the ronde dashboard
	And I click the "new_event" link
	And I leave the "Name" field blank
	And I press "Create"
	Then I should see "Name can't be blank"

Scenario: Invalid Description
	Given I am logged in as user SondeFirst
	Given I am on the ronde dashboard
	And I click the "new_event" link
	When I fill in "event[name]" with "49ers Party"
	And I leave the "Description" field blank
	And I press "Create"
	Then I should see "Description can't be blank"

Scenario: Invalid Location
	Given I am logged in as user SondeFirst
	Given I am on the ronde dashboard
	And I click the "new_event" link
	When I fill in "event[name]" with "49ers Party"
	And I fill in "event[description]" with "Beat the Shehawks"
	And I fill in "event[event_type]" with "other"		
	And I leave the "Location" field blank
	And I press "Create"
	Then I should see "Location can't be blank"

Scenario: Invalid Event Type
	Given I am logged in as user RondeFirst
	Given I am on the ronde dashboard
	And I click the "new_event" link
	And I fill in "event[name]" with "49ers Party"
	And I fill in "event[location]" with "My house"
	And I fill in the "event[start]" with "12:00 PM"
	And I fill in the "event[end]" with "1:00 PM"
	And I fill in "event[description]" with "Beat the Shehawks"
	And I leave the "Event Type" field blank
	And I press "Create"
	Then I should see "Event type can't be blank"


Scenario: Created Events
	Given I am logged in as user RondeFirst
	Then I should see "RondeFirst"
	Given I have created an event called "Blorg" as "RondeFirst"
	Given I am on the ronde dashboard
	And I follow "all_events"
	And I follow "created"
	Then I should see "Blorg"

Scenario: Invite Friend to an Event
	Given I am logged in as user SondeFirst
	Given "SondeFirst" has sent a friend request to "RondeFirst"
	Given I have signed out
	Given I am logged in as user RondeFirst
	And I am on the ronde dashboard
	Then I should see "friends"
	When I follow "friends"
	Then I should see "SondeFirst"
	When I press "✓"
	Then I should see "You and SondeFirst SondeLast are now friends."
	Given I have created an event called "Blorg" as "RondeFirst"
	Given I am on the page for the event called "Blorg"
	Then I should see "Blorg"
	And I follow "Invite Friends"
	And I choose SondeFirst
	And I click "Invite"
	Then I am on the ronde dashboard
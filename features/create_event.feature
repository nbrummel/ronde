Feature: Events
	As a user
	So I can meet with friends
	I want to be able to create an event


	Given the following users exist:
	| email           | first_name | last_name | phone_number | password      |
	| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
	| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Scenario: Creating a new Event
	Given I am logged in as RondeFirst
	Given I am on the ronde dashboard
	Then I should see "new event"
	And I click the "new_event" link
	Then I should be on the new events page
	And I fill in "Name" with "49ers Party"
	And I fill in "Location" with "My house"
	And I fill in the start time
	And I select the event type
	And I fill in "Description" with "Beat the Shehawks"
	And I press "Create Event"
	Then I should be on the all events page
	And I should see "49ers Party"

Scenario: Invalid Name
	Given I am logged in as RondeFirst
	Given I am on the ronde dashboard
	And I click the "new_event" link
	Then I should be on the new events page
	And I leave the "Name" field blank
	And I press "Create Event"
	Then I should see "Name can't be blank"

Scenario: Invalid Description
	Given I am logged in as RondeFirst
	Given I am on the ronde dashboard
	And I click the "new_event" link
	Then I should be on the new events page
	When I fill in "Name" with "49ers Party"
	And I leave the "Description" field blank
	And I press "Create Event"
	Then I should see "Description can't be blank"

Scenario: Invalid Event Type
	Given I am logged in as RondeFirst
	Given I am on the ronde dashboard
	And I click the "new_event" link
	Then I should be on the new events page
	When I fill in "Name" with "49ers Party"
	And I fill in "Description" with "Beat the Shehawks"
	And I leave the "Event Type" field blank
	And I press "Create Event"
	Then I should see "Event type can't be blank"

Scenario: Invalid Location
	Given I am logged in as RondeFirst
	Given I am on the ronde dashboard
	And I click the "new_event" link
	Then I should be on the new events page
	When I fill in "Name" with "49ers Party"
	And I fill in "Description" with "Beat the Shehawks"
	And I select the event type
	And I leave the "Location" field blank
	And I press "Create Event"
	Then I should see "Location can't be blank"

#Scenario: Invited Events
#	Given I am on the ronde dashboard
#	And I click "Events I have been invited to"
#	Then I should see all of the events I have been invited to

#Scenario: Created Events
#	Given I am on the ronde dashboard
#	And I click "Events I have created"
#	Then I should see all of the events I have created

#Scenario: Joined Events
#	Given I am on the ronde dashboard
#	And I click "Events I have joined"
#	Then I should see all of the events I have joined

#Scenario: Invite Friend to an Event
#	Given I am logged in as RondeFirst
#	Given I have created an event
#	Given I am on the page for that event
#	And I click "Invite Friends"
#	And I choose SondeFirst
#	And I click "Invite"
#	Then I should bee on the page for that event
#	When I click "Invited"
#	Then I should see "SondeFirst"





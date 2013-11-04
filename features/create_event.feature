Feature: Create an Event
	As a user
	So I can meet with friends
	I want to be able to create an event

Background: I am visiting the website for the first time this session

	Given the following users exist:
	| email           | first_name | last_name | phone_number | password      |
	| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
	| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Scenario: Creating a new Event
	Given I am on the ronde dashboard
	And I click the "New Event" link
	Then I should be on the new events page
	And I fill in "Event Name" with "49ers Party"
	And I fill in "Location" with "My house"
	And I fill in "Start Time" with Time.now
	And I fill in "Description" with "Beat the Shehawks"
	And I press "Create Event"
	Then I should be on my dashboard page
	And I should see "49ers Party"





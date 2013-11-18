Feature: 
	As a user
	So I can get more friends in ronde
	I want to be able to search for my friends

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Scenario: Search by first name
	Given I am logged in as RondeFirst
	And I am on the ronde dashboard
	And I search for "SondeFirst"
	Then I should see "SondeFirst SondeLast"
	When send "SondeFirst" a friend request
	And I click "friends"
	I should see "SondeFirst SondeLast" as a pending friend

Scenario: Search by last name
	Given I am logged in as RondeFirst
	And I am on the ronde dashboard
	And I search for "SondeFirst"
	Then I should see "SondeFirst SondeLast"
	When send "SondeFirst" a friend request
	And I click "friends"
	I should see "SondeFirst SondeLast" as a pending friend
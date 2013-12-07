Feature: 
	As a user
	I want to be able to send a friend request
	So I can have more friends on ronde

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Scenario: Send a friend request
	Given I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the ronde dashboard
	When I follow "friends"
	And I fill in "search_param" with "sonde@gmail.com"
	And I press "Search"
	Then I press "+"
	And I should see "You have successfully sent SondeFirst SondeLast a friend request."
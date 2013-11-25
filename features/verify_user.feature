Feature: 
	As a user
	I shouldn't be able to access other user's profiles
	So ronde is secure

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Scenario: A user tries to access another users data when not logged in
	Given I am on the ronde "home" page
	And I try to visit the friends page of another user
	Then I should be on the ronde "home" page
	And I should see "sign up"

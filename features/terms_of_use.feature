Feature:
	As a user
	I want to see ronde's terms of use
	So I know what I'm agreeing to when I sign up for ronde

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Scenario: See the terms of use page
	Given I am on the ronde "home" page
	And I follow "Terms of Use"
	Then I should see "Errata"

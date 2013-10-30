Feature: ronde homepage
	As a user
	So I can learn more about ronde
	I want to visit the about ronde page for more information

Background: I am visiting the website for the first time this session

	Given the following users exist:
	| email           | first_name | last_name | phone_number | password      |
	| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |
	| sonde@gmail.com | SondeFirst | SondeLast | 5105105102   | SondePassword |

Scenario: Visiting the about page
	Given I am on the ronde homepage
	And I click the "about" link
	Then I should be on the ronde about page

Scenario: Visiting the terms of use page
	Given I am on the ronde homepage
	And I click the "terms of use" link
	Then I should be on the ronde terms of use page

Scenario: Visiting the contact page
	Given I am on the ronde homepage
	And I click the "contact" link
	Then I should be on the ronde contact page





Feature:
	As a user
	I want to be able to edit my account settings
	So I can change my account information

Background: I am visiting the website for the first time this session

Given the following users exist:
| email           | first_name | last_name | phone_number | password      |
| ronde@gmail.com | RondeFirst | Rondelast | 5105105101   | RondePassword |

Scenario: Change email from account settings
	Given I am logged in as "ronde@gmail.com" with password "RondePassword"
	And I am on the ronde "home" page
	And I follow "settings"
	And I follow "account"
	And I follow "edit account"
	And I fill in "user_email" with "ronde234@gmail.com"
	And I fill in "user_current_password" with "RondePassword"
	And I press "Update"
	And I follow "settings"
	And I follow "account"
	Then I should see "ronde234@gmail.com"
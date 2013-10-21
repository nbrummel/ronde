Feature: user can login to ronde

  As a new visitor
  So I can access my account and its settings
  I want to be able to login to ronde using different methods

Background: I am visiting the website for the first time this session
 Given the user exists with the following details:
      | Email			| ronde@gmail.com | 
      | First name    		| RondeFirst	  |
      | Last name     		| RondeLast	  |
      | Phone number  		| 5105105101	  |
      | Password	 	| RondePassword   |
      | Password confirmation	| RondePassword   |

 And I am on the ronde home page

Scenario: Logging in by entering details

 When I press "Sign In"

 When I fill in "ronde@gmail.com" for "Email"

 When I fill in "RondePassword" for "Password"

 When I press "Sign in"	

 Then I should see "Signed in successfully"

Scenario: Logging in with invalid password

 When I press "Sign In"

 When I fill in "ronde@gmail.com" for "Email"

 When I fill in "electricboogaloo" for "Password"

 Then I should see "Invalid email or password."

Scenario: Logging in with invalid email

 When I press "Sign In"

 When I fill in "electricboogaloo@gmail.com" for "Email"

 When I fill in "RondePassword" for "Password"

 When I press "Sign in"

 Then I should see "Invalid email or password."

 
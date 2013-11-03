
Feature: ronde homepage links

  As a user
  So I can learn more about ronde
  I want to visit the about ronde page for more information

Background: I am on the ronde "home" page

Scenario: Visiting the home page
  Given I am on the ronde "about" page
  And I click the "home" link
  Then I should be on the ronde "home" page

Scenario: Visiting the about page
  Given I am on the ronde "home" page
  And I click the "about" link
  Then I should be on the ronde "about" page 

Scenario: Visiting the terms of use page
  Given I am on the ronde "home" page
  And I click the "terms of use" link
  Then I should be on the ronde "terms of use" page

Scenario: Visiting the contact page
  Given I am on the ronde "home" page
  And I click the "contact" link
  Then I should be on the ronde "contact" page  



 
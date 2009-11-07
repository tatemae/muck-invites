Feature: View invites page
  As a user
  I want to be able to view and add invites
  
Scenario: Anonymous user visits the invites
  Given I am not logged in
  And There are invites
  When I go to "the show invites page"
  Then I should see "invites"
  
Scenario: Logged in user views add invite
  Given I log in with role "administrator"
  When I go to "the create invites page"
  Then I should see "Add a new invite"

Scenario: Add invite
  GivenScenario: Logged in user views add invite
  When I fill in "invite_body" with "a test invite"
  And I press "Add Invite"
  Then I should see "added invite"
  
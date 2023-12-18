Feature: Test notification feature of gig pro
	Including sending notifications for actions, deleting them and clicking on them

Background: workers and customers have been added to the database

  Given the following users exist:
  | name                   | email             | password   | worker_rating |  balance |
  | Customer               | customer@mail.com |customerpass| 0             |  1000    |
	| Worker1              	 | Worker1@mail.com  |workerpass  | 0             |  1000    |
	| Worker2                | Worker2@mail.com  |workerpass  | 0             |  0       |
	Given the following gigs exist:
	| title                  | description       | location   | payment |  customer_id | worker_id|
	| gig1                   | gig description   | NY         | 10      |     1        |          |
	| gig2                   | gig description   | NY         | 10      |     1        |          |
	 And  I am on the gigs page
  Then 3 seed users should exist
	And 2 seed gigs should exist

Scenario: create gig sends notification to all other users
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "New Gig"
	And I fill in "gig_title" with "TestTitle"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "TestLocation"
	And I fill in "gig_payment" with "10"
	And I press "Create gig"
	And I follow "Log out"
	And I follow "Log in"
	And I fill in "session_email" with "Worker1@mail.com"
	And I fill in "session_password" with "workerpass"
	And I press "Log in"
	And I follow "Notifications"
	And I should see "A new Gig has been created!"
	And I follow "Log out"
	And I follow "Log in"
	And I fill in "session_email" with "Worker2@mail.com"
	And I fill in "session_password" with "workerpass"
	And I press "Log in"
	And I follow "Notifications"
	And I should see "A new Gig has been created!"

Scenario: Deleting a gig deletes notifications
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "New Gig"
	And I fill in "gig_title" with "TestTitle"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "TestLocation"
	And I fill in "gig_payment" with "10"
	And I press "Create gig"
	And I follow "Log out"
	And I follow "Log in"
	And I fill in "session_email" with "Worker1@mail.com"
	And I fill in "session_password" with "workerpass"
	And I press "Log in"
	And I follow "Notifications"
	And I should see "A new Gig has been created!"
	And I follow "Log out"
	And I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "TestTitle"
	And I follow "Delete"
	And I follow "Log out"
	And I follow "Log in"
	And I fill in "session_email" with "Worker1@mail.com"
	And I fill in "session_password" with "workerpass"
	And I press "Log in"
	And I follow "Notifications"
	And I should not see "A new Gig has been created!"


Scenario: Accepting a gig sends a notification, completing a gig deletes notifications and notifications are clickable
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "New Gig"
	And I fill in "gig_title" with "TestTitle"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "TestLocation"
	And I fill in "gig_payment" with "10"
	And I press "Create gig"
	And I follow "Log out"
	And I follow "Log in"
	And I fill in "session_email" with "Worker1@mail.com"
	And I fill in "session_password" with "workerpass"
	And I press "Log in"
	And I follow "Notifications"
	And I should see "A new Gig has been created!"
	And I follow "Gig"
	And I follow "Accept"
	And I follow "Log out"
	And I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Notifications"
	And I should see "Your Gig has been accepted!"
	And I follow "Gig"
	And I follow "Complete"
	And I follow "Log out"
	And I follow "Log in"
	And I fill in "session_email" with "Worker1@mail.com"
	And I fill in "session_password" with "workerpass"
	And I press "Log in"
	And I follow "Notifications"
	And I should not see "A new Gig has been created!"

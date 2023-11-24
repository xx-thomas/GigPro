Feature: Test main features of gig pro
	Including assigning gigs, completing gigs and changing languages

Background: workers and customers have been added to the database

  Given the following users exist:
  | name                   | email             | password   | worker_rating |  balance |
  | Customer               | customer@mail.com |customerpass| 0             |  1000     |
	| Worker                 | worker@mail.com   |workerpass  | 0             |  0        |
	Given the following gigs exist:
	| title                  | description       | location   | payment |  customer_id | worker_id |
	| gig1                    | gig description   | NY         | 10      |     1        |          |
	| gig2                    | gig description   | NY         | 10      |     1        |      2   |
	 And  I am on the gigs page
  Then 2 seed users should exist
	And 2 seed gigs should exist

Scenario: assign gig
	When I follow "Log in"
	And I fill in "session_email" with "worker@mail.com"
	And I fill in "session_password" with "workerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "gig1"
	And I should see "Accept"
	And I follow "Accept"
	Then I should see "Worker: Worker"

Scenario: complete gig
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "gig2"
	And I should see "Complete"
	And I follow "Complete"
	Then I am on the gigs page


Scenario: edit gig
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "gig1"
	And I should see "Edit"
	And I follow "Edit"
	Then I should see "Update gig"
	And I press "Create gig"

Scenario: destroy gig
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "gig1"
	And I should see "Delete"
	And I follow "Delete"
	Then I am on the gigs page
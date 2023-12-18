Feature: edit gigs
	Test various aspects of editing gigs

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

Scenario: edit not visible after assignment
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "gig2"
	And I should not see "Edit"

Scenario: edit without balance is denied
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "gig1"
	And I follow "Edit"
	And I fill in "gig_payment" with "1001"
	And I press "Create gig"
	Then I should see "You don't have enough balance!"

Scenario: edit with negative payment is denied
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "gig1"
	And I follow "Edit"
	And I fill in "gig_payment" with "-6"
	And I press "Create gig"
	Then I should see "Payment needs to be positive"

Scenario: edit with past deadline is denied
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "gig1"
	And I follow "Edit"
	And I fill in "gig_deadline" with "2000-12-04T11:01"
	And I press "Create gig"
	Then I should see "Deadline is in the past! Please remove or update to the future"
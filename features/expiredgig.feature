Feature: Test expiration of gigs in gigpro

Background: workers and customers have been added to the database along notifications that should be deleted for expired gigs

  Given the following users exist:
  | name                   | email             | password   | worker_rating |  balance |
  | Customer               | customer@mail.com |customerpass| 0             |  1000     |
	| Worker1                 | worker1@mail.com   |workerpass  | 0             |  0        |
	| Worker2                 | worker2@mail.com   |workerpass  | 0             |  0        |
	Given the following gigs exist:
	| title                  | description       | location   | payment |  customer_id | worker_id | deadline |
	| gig1                    | gig description   | NY         | 10      |     1        |          |2000-12-04T11:01|
	| gig2                    | gig description   | NY         | 10      |     1        |      2   |2000-12-04T11:01 |
	Given the following notifications exist:
	| read                     | user_id       | gig_id   | notification_type |
	| false                    | 2   | 1         | CREATE      |
	| false                    | 3   | 1         | CREATE      |
	| false                    | 1   | 2         | ACCEPT      |
	 And  I am on the gigs page
  Then 3 seed users should exist
	And 1	seed notification should exist
Scenario: assigned gig should not expire
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	Then I should see "gig2"
Scenario: unassigned gig should expire
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	Then I should not see "gig1"

Feature: create gigs
	Test various aspects of creating gigs

Background: workers and customers have been added to the database

  Given the following users exist:
  | name                   | email             | password   | worker_rating |  balance |
  | Customer               | customer@mail.com |customerpass| 0             |  1000     |
	| Worker                 | worker@mail.com    |workerpass  | 0             |  0        |

  And  I am on the home page
  Then 2 seed users should exist
Scenario: create gig
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
	Then I should see "Gig: TestTitle"
	And I should see "Description: TestDescription"
	And I should see "Location: TestLocation"
	And I should see "Payment: 10"


Scenario: attempt to create gig without enough balance
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "New Gig"
	And I fill in "gig_title" with "TestTitle"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "TestLocation"
	And I fill in "gig_payment" with "1000000000"
	And I press "Create gig"
	Then I should see "You don't have enough balance!"

Scenario: attempt to create gig with negative payment
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "New Gig"
	And I fill in "gig_title" with "TestTitle"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "TestLocation"
	And I fill in "gig_payment" with "-6"
	And I press "Create gig"
	Then I should see "Payment needs to be positive"

Scenario: attempt to create gig without payment
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "New Gig"
	And I fill in "gig_title" with "TestTitle"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "TestLocation"
	And I fill in "gig_payment" with "0"
	And I press "Create gig"
	Then I should see "Payment needs to be positive"

Scenario: attempt to create gig with past deadline
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
	And I fill in "gig_deadline" with "2000-12-04T11:01"
	And I press "Create gig"
	Then I should see "Deadline is in the past! Please remove or update to the future"

Scenario: Allow Edit and Delete after gig creation
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
	Then I should see "Gig: TestTitle"
	And I should see "Description: TestDescription"
	And I should see "Location: TestLocation"
	And I should see "Payment: 10"
	And I should see "Edit"
	And I should see "Delete"

Scenario: attempt to create gig without filling out required field
	When I follow "Log in"
	And I fill in "session_email" with "customer@mail.com"
	And I fill in "session_password" with "customerpass"
	And I press "Log in"
	And I follow "Gigs"
	And I follow "New Gig"
	And I fill in "gig_title" with "TestTitle"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "TestLocation"
	And I press "Create gig"
	Then I should see "Please make sure Title, Location and Payment are provided!"
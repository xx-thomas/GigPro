Feature: create gig
	gigs should be able to be created once worker and customer exists

Background: workers and customers have been added to the database

  Given the following customers exist:
  | name                   | location | number    |  balance |
  | Customer1              | NY       | 123456789 |  100     |
	| Customer2              | NY       | 023456789 |  50      |

	Given the following workers exist:
  | name                   | location | number    |  language_preference | balance | rating
  | Worker1                | NY       | 435435435 |  English             |   0     | 0
	| Worker2                | NY       | 234324342 |  Spanish             |   0     | 0
  And  I am on the gigs page
  Then 2 seed customers should exist
	And 2 seed workers should exist

Scenario: create gig
	When I follow "New Gig"
	And I fill in "gig_customer_id" with "1"
	And I fill in "gig_worker_id" with "1"
	And I fill in "gig_title" with "TestGig"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "NY"
	And I fill in "gig_payment" with "10"
	And I press "Create Gig"
	Then I should see "Gig: TestGig"
	And I should see "Description: TestDescription"
	And I should see "Location: NY"
	And I should see "Payment: 10"
	And I should see "Customer ID: 1"
	And I should see "Assigned Worker ID: 1"

Scenario: create gig without customer and fail
	When I follow "New Gig"
	And I fill in "gig_title" with "TestGig"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "NY"
	And I fill in "gig_payment" with "10"
	And I press "Create Gig"
	Then I should see "Customer can't be blank"

Scenario: create gig without title and fail
	When I follow "New Gig"
	And I fill in "gig_customer_id" with "1"
	And I fill in "gig_worker_id" with "1"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "NY"
	And I fill in "gig_payment" with "10"
	And I press "Create Gig"
	Then I should see "Title can't be blank"

Scenario: create gig without payment and fail
	When I follow "New Gig"
	And I fill in "gig_customer_id" with "1"
	And I fill in "gig_worker_id" with "1"
	And I fill in "gig_title" with "TestGig"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "NY"
	And I press "Create Gig"
	Then I should see "Payment can't be blank"
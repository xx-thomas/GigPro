Feature: gigpro
	The main purpose of gigpro is to assign workers to gig
	and workers should be compensated by the customer.
	After completing gigs, workers credibility should increase via their rating.
	Customers should also be able to touch their posted gigs after creation.
	Touch meaning edit details or bring down entirely.

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

Scenario: create gig without worker and assign worker after
	When I follow "New Gig"
	And I fill in "gig_customer_id" with "1"
	And I fill in "gig_title" with "TestGig"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "TestLocation"
	And I fill in "gig_payment" with "10"
	And I press "Create Gig"
	Then I should see "Gig: TestGig"
	And I should see "Assigned Worker ID:"
	When I follow "Edit"
	And I fill in "gig_worker_id" with "1"
	And I press "Update Gig"
	Then I should see "Gig: TestGig"
	And I should see "Assigned Worker ID: 1"

Scenario: create gig and update payment after
	When I follow "New Gig"
	And I fill in "gig_customer_id" with "1"
	And I fill in "gig_title" with "TestGig"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "TestLocation"
	And I fill in "gig_payment" with "10"
	And I press "Create Gig"
	Then I should see "Gig: TestGig"
	And I should see "Description: TestDescription"
	And I should see "Location: TestLocation"
	And I should see "Payment: 10"
	And I should see "Customer ID: 1"
	When I follow "Edit"
	And I fill in "gig_payment" with "25"
	And I press "Update Gig"
	Then I should see "Gig: TestGig"
	And I should see "Payment: 25"

Scenario: create gig and delete after
	When I follow "New Gig"
	And I fill in "gig_customer_id" with "1"
	And I fill in "gig_title" with "TestGig"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "TestLocation"
	And I fill in "gig_payment" with "10"
	And I press "Create Gig"
	Then I should see "Gig: TestGig"
	And I should see "Description: TestDescription"
	And I should see "Location: TestLocation"
	And I should see "Payment: 10"
	And I should see "Customer ID: 1"
	When I follow "Destroy"
	Then I am on the gigs page
	And I should not see " Gig: TestGig, Location: TestLocation, Payment: 10, Deadline:"

Scenario: create gig and complete
	When I follow "New Gig"
	And I fill in "gig_customer_id" with "1"
	And I fill in "gig_worker_id" with "1"
	And I fill in "gig_title" with "TestGig"
	And I fill in "gig_description" with "TestDescription"
	And I fill in "gig_location" with "TestLocation"
	And I fill in "gig_payment" with "10"
	And I press "Create Gig"
	Then I should see "Gig: TestGig"
	And I should see "Description: TestDescription"
	And I should see "Location: TestLocation"
	And I should see "Payment: 10"
	And I should see "Customer ID: 1"
	And I should see "Assigned Worker ID: 1"
	When I follow "Complete"
	Then I am on the workers page
	And I should see "Worker: Worker1, Location: NY, Contact: 435435435, Rating: 1.0, Balance: 10.0"
	Then I am on the customers page
	And I should see "Customer: Customer1, Location: NY, Contact: 123456789, Balance: 90.0"
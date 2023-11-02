Feature: create worker
	should be able to create workers and creation should not work
	without required inputs

Scenario: create worker
	Given  I am on the workers page
	When I follow "New Worker"
	And I fill in "worker_name" with "Worker1"
	And I fill in "worker_location" with "TestLocation"
	And I fill in "worker_number" with "1234567899"
	And I fill in "worker_language_preference" with "Spanish"
	And I press "Create Worker"
	Then I should see "Worker: Worker1, Location: TestLocation, Contact: 1234567899, Rating: 0.0, Balance: 0.0"

Scenario: create worker without name should fail
	Given  I am on the workers page
	When I follow "New Worker"
	And I fill in "worker_location" with "TestLocation"
	And I fill in "worker_number" with "1234567899"
	And I fill in "worker_language_preference" with "Spanish"
	And I press "Create Worker"
	Then I should see "Name can't be blank"

	Scenario: create worker without location should fail
	Given  I am on the workers page
	When I follow "New Worker"
	And I fill in "worker_name" with "Worker1"
	And I fill in "worker_number" with "1234567899"
	And I fill in "worker_language_preference" with "Spanish"
	And I press "Create Worker"
	Then I should see "Location can't be blank"
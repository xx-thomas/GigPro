Feature: create customers
	should be able to create customers and creation should not work
	without required inputs

Scenario: create customer
	Given  I am on the customers page
	When I follow "New Customer"
	And I fill in "customer_name" with "Customer1"
	And I fill in "customer_location" with "TestLocation"
	And I fill in "customer_number" with "1234567899"
	And I press "Create Customer"
	Then I should see "Customer: Customer1, Location: TestLocation, Contact: 1234567899, Balance: 0.0"

Scenario: create customer without name should fail
	Given  I am on the customers page
	When I follow "New Customer"
	And I fill in "customer_location" with "TestLocation"
	And I fill in "customer_number" with "1234567899"
	And I press "Create Customer"
	Then I should see "Name can't be blank"

	Scenario: create customer without location should fail
	Given  I am on the customers page
	When I follow "New Customer"
	And I fill in "customer_name" with "Customer1"
	And I fill in "customer_number" with "1234567899"
	And I press "Create Customer"
	Then I should see "Location can't be blank"
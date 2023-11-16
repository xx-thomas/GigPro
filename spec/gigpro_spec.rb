require 'rails_helper'


# describe 'new worker', :pending => false do
# 	it "takes parameters and returns a Worker object" do      
# 		@worker = Worker.new(:name => 'name', :location => 'location')
# 		expect(@worker).to be_an_instance_of(Worker)
# 		expect(@worker.name).to eq('name')
# 		expect(@worker.location).to eq('location')
# 		expect(@worker.rating).to eq(0.0)
# 		expect(@worker.balance).to eq(0.0)
# 	end
# end

# describe 'new customer', :pending => false do
# 	it "takes parameters and returns a Customer object" do      
# 		@customer = Customer.new(:name => 'name', :location => 'location')
# 		expect(@customer).to be_an_instance_of(Customer)
# 		expect(@customer.name).to eq('name')
# 		expect(@customer.location).to eq('location')
# 		expect(@customer.balance).to eq(0.0)
# 	end
# end

# describe 'new gig', :pending => false do
# 	it "takes parameters and returns a Gig object" do      
# 		@worker = Worker.new(:name => 'name', :location => 'location')
# 		@customer = Customer.new(:name => 'name', :location => 'location')
# 		@gig = Gig.new(:title => 'title', :payment => 1.0, :customer => @customer.id)
# 		expect(@gig).to be_an_instance_of(Gig)
# 		expect(@gig.title).to eq('title')
# 		expect(@gig.payment).to eq(1.0)
# 		expect(@gig.customer).to eq(@customer.id)
# 	end
# end

# describe 'update gig', :pending => false do
# 	it "updates gig after creation" do      
# 		@worker = Worker.new(:name => 'name', :location => 'location')
# 		@customer = Customer.new(:name => 'name', :location => 'location')
# 		@gig = Gig.new(:title => 'title', :payment => 1.0, :customer => @customer.id)
# 		expect(@gig).to be_an_instance_of(Gig)
# 		expect(@gig.payment).to eq(1.0)
# 		@gig.update(payment: 2.0)
# 		expect(@gig.payment).to eq(2.0)
# 	end
# end
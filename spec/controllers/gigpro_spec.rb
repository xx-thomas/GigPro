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

RSpec.feature 'Layout', type: :feature do
    scenario 'User sees the correct title' do
      visit root_path
      expect(page).to have_title('GigPro')
    end
  
    scenario 'User can navigate to the gigs page' do
      visit root_path
      click_link t(:gigs)
      expect(page).to have_current_path(root_path)
    end

    scenario 'User sees text in English' do
        visit root_path
        expect(page).to have_content('GigPro')
        expect(page).to have_content('Gigs')
        expect(page).to have_content('Log in')
        expect(page).to have_content('New Gig')
      end
    
      scenario 'User sees text in Spanish' do
        visit change_language_path(locale: 'es', method: :post)
        visit root_path
        expect(page).to have_content('GigPro')
        expect(page).to have_content('Trabajos')
        expect(page).to have_content('Accesar')
        expect(page).to have_content('Nuevo Trabajo')
      end

end

RSpec.describe GigsController, type: :controller do
    include FactoryBot::Syntax::Methods

    let(:user) { create(:user) }
  
    describe 'GET #index' do
      it 'renders the index template' do
        get :index
        expect(response).to render_template :index
      end
    end
  
     describe 'GET #index' do
      it 'renders the index template' do
        get :index
        expect(response).to render_template :index
    end
    end

    describe 'GET #show' do
     let(:gig) { create(:gig) }

     it 'renders the show template' do
       get :show, params: { id: gig.id }
       expect(response).to render_template :show
     end
    end


    describe 'GET #new' do
    context 'when user is logged in' do
      let(:user) { create(:user) }

      before do
        log_in(user)
      end

      it 'renders the new template and initializes a new gig' do
        get :new
        expect(response).to render_template :new
        expect(assigns(:gig)).to be_a_new(Gig)
      end
    end

    context 'when user is not logged in' do
        it 'does not render the new template' do
        get :new
        expect(response).to redirect_to(login_url) 
        end
    end
    end


#    describe 'POST #create' do
#   context 'when user is logged in' do
#        let(:user) { create(:user) }
#  
#        before do
#          log_in(user)
#        end
#  
#        it 'creates a new gig with valid parameters' do
#          post :create, params: { gig: attributes_for(:gig) }
#          expect(response).to redirect_to(assigns(:gig))
#        end
#  
#     end
#    end
#
    include SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
    end
end


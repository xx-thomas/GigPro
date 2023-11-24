require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include FactoryBot::Syntax::Methods

  describe 'GET #show' do
    let(:user) { create(:user) }

    it 'renders the show template' do
      get :show, params: { id: user.id }
      expect(response).to render_template :show
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
#  context 'with valid parameters' do
#    let(:valid_params) { attributes_for(:user) }
#
#    it 'creates a new user' do
#      post :create, params: { user: valid_params }
#
#      puts "Response status: #{response.status}"
#      puts "Response body: #{response.body}"
#
#      expect(response).to have_http_status(:redirect)
#      expect(response).to redirect_to(assigns(:user))
#      expect(flash[:success]).to include("Welcome to GigPro '#{valid_params[:name]}'")
#    end
#  end

  context 'with invalid parameters' do
    let(:invalid_params) { attributes_for(:user, email: 'invalid_email') }

    it 'does not create a new user and renders the new template with an error message' do
      post :create, params: { user: invalid_params }

      puts "Response status: #{response.status}"
      puts "Response body: #{response.body}"

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end
end
end

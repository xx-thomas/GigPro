require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  include FactoryBot::Syntax::Methods

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user, email: 'test@example.com', password: 'password') }

    context 'with valid credentials' do
      it 'logs in the user and redirects to the user profile' do
        post :create, params: { session: { email: user.email, password: 'password' } }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to user
        expect(flash[:danger]).to be_nil
      end
    end

    context 'with invalid credentials' do
      it 'does not log in the user and renders the new template with an error message' do
        post :create, params: { session: { email: 'invalid@example.com', password: 'invalid' } }

        expect(response).to render_template :new
        expect(flash[:danger]).to include('Invalid email/password!')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out the user and redirects to the root_url' do
      delete :destroy

      expect(response).to redirect_to root_url
    end
  end
end
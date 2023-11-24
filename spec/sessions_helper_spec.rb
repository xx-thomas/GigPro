require 'rails_helper'
include SessionsHelper

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { create(:user) } 

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  describe '#log_in' do
    it 'logs in the user' do
      log_in(user)
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe '#log_out' do
    it 'logs out the user' do
      log_in(user)
      log_out
      expect(session[:user_id]).to be_nil
      expect(current_user).to be_nil
    end
  end

  describe '#current_user' do
    it 'returns the current user' do
      log_in(user)
      expect(current_user).to eq(user)
    end

    it 'returns nil if user is not logged in' do
      expect(current_user).to be_nil
    end
  end

  describe '#logged_in?' do
    it 'returns true if the user is logged in' do
      log_in(user)
      expect(logged_in?).to be_truthy
    end

    it 'returns false if the user is not logged in' do
      expect(logged_in?).to be_falsey
    end
  end
end

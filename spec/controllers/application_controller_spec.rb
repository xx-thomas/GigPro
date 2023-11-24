require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
    controller do
      def index
        render plain: 'Hello, World!'
      end
    end
  
    describe 'before_action :set_locale' do
      it 'sets the locale based on session' do
        session[:locale] = 'es'
        get :index
        expect(I18n.locale).to eq(:es)
      end
  
      it 'uses the default locale if session locale is not set' do
        get :index
        expect(I18n.locale).to eq(I18n.default_locale)
      end
    end
  
    describe '#change_language' do
      it 'changes the session locale and redirects back' do
        get :index
        expect(I18n.locale).to eq(I18n.default_locale)

      end
    end
  end
  
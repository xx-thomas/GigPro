class ApplicationController < ActionController::Base
	include SessionsHelper
	before_action :set_locale

    def set_locale
      I18n.locale = session[:locale] || I18n.default_locale
    end

    def change_language
      session[:locale] = params[:locale]
      redirect_back fallback_location: root_path
    end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_default_user

  def set_default_user
    @user = current_user ? current_user : User.first
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end

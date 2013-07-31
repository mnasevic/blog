class Editor::BaseController < ApplicationController

  before_filter :authenticate

  private
  def authenticate
    redirect_to login_url, :error => "Access denied." unless current_user
  end
end

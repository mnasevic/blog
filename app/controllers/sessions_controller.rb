class SessionsController < ApplicationController
  layout 'sign'

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => 'Logged in!'
    else
        flash[:error] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => 'Logged out!'
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end

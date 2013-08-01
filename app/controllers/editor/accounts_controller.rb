class Editor::AccountsController < Editor::BaseController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to edit_editor_account_path, :notice => "You have successfully updated your account."
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

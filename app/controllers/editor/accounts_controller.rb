class Editor::AccountsController < Editor::BaseController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(params.require(:user).permit(:email, :password, :password_confirmation))
      redirect_to edit_editor_account_path, :notice => "You have successfully updated your account."
    else
      render 'edit'
    end
  end
end

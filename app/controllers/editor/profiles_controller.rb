class Editor::ProfilesController < Editor::BaseController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(params.require(:user).permit(:name, :job_title, :avatar, :about_info, :linkedin_url, :project_info, :github_url))
      redirect_to edit_editor_profile_path, :notice => "You have successfully updated your profile."
    else
      render 'edit'
    end
  end
end

class AddAdditionInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :job_title, :string
    add_column :users, :avatar, :string
    add_column :users, :about_info, :text
    add_column :users, :linkedin_url, :string
    add_column :users, :github_url, :string
    add_column :users, :project_info, :text
  end
end

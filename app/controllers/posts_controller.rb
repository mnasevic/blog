class PostsController < ApplicationController
  def show
    @post = @user.posts.published.find(params[:id])
  end
end

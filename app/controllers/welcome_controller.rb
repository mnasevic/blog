class WelcomeController < ApplicationController
  def index
    @featured_post = @user.posts.published.order('published_at DESC').last
  end
end

class Editor::PostsController < Editor::BaseController

  def index
    @posts = current_user.posts.order('created_at DESC')
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to editor_post_path(@post), :notice => "You have successfully created new post."
    else
      render 'new'
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to editor_post_path(@post), :notice => "You have successfully updated your post."
    else
      render 'edit'
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to editor_posts_path, :notice => "You have successfully deleted your post."
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :description, :is_publish, :published_at)
  end
end

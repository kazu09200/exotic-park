class User::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @user = current_user
    @post = Post.new
    @posts = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      @user = current_user
      @posts = Post.all
      render :index
    end
  end

  def show
    @new_post = Post.new
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
     @post = Post.find(params[:id])
    if @post.user == current_user
        render "edit"
    else
      redirect_to posts_path
    end
  end
  
  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      flash[:notice]="You have updated book successfully."
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice]="You have destroyed book successfully."
      redirect_to posts_path
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :body, :image, :content)
    end
end

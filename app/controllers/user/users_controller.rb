class User::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
  end


  def edit
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :name, :is_active,:profile_image)
  end
end

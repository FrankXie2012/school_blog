class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def all_blogs
    @posts = Post.all
  end
end
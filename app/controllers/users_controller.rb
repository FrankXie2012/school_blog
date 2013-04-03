class UsersController < ApplicationController
  before_filter :admin_required, only: :index

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    ap @user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_info_user_path(@user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def all_posts
    @posts = Post.all
  end

  def user_info
    @user = User.find(params[:id])
  end

  def edit_posts
    @posts = Post.all
  end
end
class UsersController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @user = current_user
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @post, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def all_blogs
    @posts = Post.all
  end
end
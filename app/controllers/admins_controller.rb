class AdminsController < ApplicationController
	before_filter :admin_required

  def index
  end

  def edit_user
  	@user = User.find(params[:id])
  	@user.set_role
  	redirect_to admin_path
  end

  def set_to_admin
    ap params
  	@user = User.find(params[:id])
  	@user.set_admin
  	@user.save!
  	redirect_to users_path
  end

  def set_to_common_user
  	@user = User.find(params[:id])
  	@user.set_common_user
  	@user.save!
  	redirect_to users_path
  end
end

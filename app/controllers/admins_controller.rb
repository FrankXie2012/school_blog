class AdminsController < ApplicationController
	before_filter :admin_required

  def index
  end

  def set_to_admin
  	@user = User.find(params[:id])
  	@user.set_admin
  	@user.save!
  	redirect_to users_path
  end

  def set_to_common_user
  	@user = User.find(params[:id])
  	@user.set_common_user
  	@user.save!
  	# redirect_to users_path
    respond_to do |format|
      format.js
    end
  end
end

class RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    if params[:user][:avatar] == nil
      root_path
    else
      crop_users_path
    end
  end
end
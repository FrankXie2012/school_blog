class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    if params[:user][:avatar].present?
      crop_users_path
    else
      root_path
    end
  end

  def after_update_path_for(resource)
    if params[:user][:avatar].present?
      crop_users_path
    else
      root_path
    end
  end
end
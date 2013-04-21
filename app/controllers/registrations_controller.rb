class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    if resource.avatar.blank?
      root_path
    else
      crop_users_path
    end
  end

  def after_update_path_for(resource)
    if resource.avatar.blank?
      root_path
    else
      crop_users_path
    end
  end
end
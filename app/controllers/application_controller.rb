class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def admin_required
    unless current_user && current_user.is_admin?
      flash[:error] = "Sorry, you don't have access to that."
      redirect_to root_url and return false
    end
  end
end

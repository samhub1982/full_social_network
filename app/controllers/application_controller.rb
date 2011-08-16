class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  private
  
  def admin_user
      @user = User.find(params[:id])
      redirect_to(root_path) if !current_user.admin? || current_user?(@user)
    end
end

class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= 1 if session[:user_id]
  end
  helper_method :current_user

  def authorize
    return unless APP_CONFIG['perform_authentication']
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
 
  def current_user
  	begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound => e
      current_user = false
    end
  end 

  def require_user
    redirect_to '/login' unless current_user
  end 

end

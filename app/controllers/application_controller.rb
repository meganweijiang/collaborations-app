class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :notification
 
  def current_user
  	begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound => e
      current_user = false
    end
  end 

  def notification
    @posts = current_user.posts.all
    @interests = Interest.where(post_id: @posts.ids).all 
    notification = false
    for interest in @interests do
      if interest.seen == false
        notification = true
      end
    end
    puts notification
    return notification
  end

  def require_user
    redirect_to '/login' unless current_user
  end 

end

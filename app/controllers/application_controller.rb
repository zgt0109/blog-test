class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :sign_in?, :current_user
 # before_filter :authenticate_user

  def sign_in?
    current_user
  end

  def sign_out
  	session[:user_id] = nil
  end

  def sign_in(user)
  	session[:user_id] = user.id
  end

  def current_user
  	@current_user ||= User.find(session[:user_id])
  end

  def authenticate_user
  	unless sign_in?
  		redirect_to sign_in_path, notice: "请登录之后再操作."
  	end
  end
end

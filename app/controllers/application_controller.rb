class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :sign_in?, :current_user
  before_filter :authenticate

  def sign_in?
    current_user
  end

  def sign_out
  	session[:user_id] = nil
  end

  def sign_in_user(user)
    session[:user_id] = user.id
  end

  def sign_in_doctor(doctor)
    session[:doctor_id] = doctor.id
  end

  def current_user
  	@current_user ||= User.get(session[:user_id]) || Doctor.get(session[:doctor_id])
  end

  def authenticate
  	unless sign_in?
  		redirect_to sign_in_path, notice: "请登录之后再操作."
  	end
  end
end

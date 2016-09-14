class SessionsController < ApplicationController
	skip_before_filter :authenticate, only: [:new, :create]

  def new
    
  end

  def create
    # binding.pry
    if params[:doctor_or_user].eql?('user')
      user = User.all(name: params[:name]).first
      if user && user.authenticate(params[:password])
        sign_in_user user
        redirect_to root_path
      else
        render sign_in_path
      end
    else
      doctor = Doctor.all(name: params[:name]).first
      if doctor && doctor.authenticate(params[:password])
        sign_in_doctor doctor
        redirect_to root_path
      else
        render sign_in_path
      end
    end
  end

  def destroy
  	sign_out
  	redirect_to sign_in_path
  end

end
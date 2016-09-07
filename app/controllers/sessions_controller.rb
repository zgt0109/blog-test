class SessionsController < ApplicationController
	skip_before_filter :authenticate, only: [:new, :create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.where(name: params[:name]).first
  	if @user && @user.authenticate(params[:password])
  		sign_in @user
  		redirect_to root_path
  	else
  		render sign_in_path
  	end
  end

  def destroy
  	sign_out
  	redirect_to sign_in_path
  end

end
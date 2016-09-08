class UsersController < ApplicationController
	skip_before_filter :authenticate, only: [:new, :create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		sign_in @user
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def info

  end

  def edit

  end

  def update
    # binding.pry
    if current_user.authenticate(params[:user][:current_password])
      current_user.update_attributes(params[:user])
      redirect_to root_path
    else
      render 'edit'
    end
  end
end

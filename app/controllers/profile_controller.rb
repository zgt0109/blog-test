class ProfileController < ApplicationController
  def info

  end

  def edit

  end

  def update
    binding.pry
    if current_user.authenticate(params[:user][:current_password])
      current_user.update(params[:user])
      redirect_to root_path
    else
      render 'edit'
    end
  end

end

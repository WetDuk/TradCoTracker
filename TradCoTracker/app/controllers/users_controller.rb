# frozen_string_literal: true

class UsersController < ApplicationController
  # This controller is what creates the new users for the database
  def index
    @users = User.search(params[:search])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # If user was able to save return to login
    if @user.save
      redirect_to(root_path)
    else # else reload new user
      redirect_to new_user_path
    end
  end

  private

  # These are the parameters for the user
  def user_params
    params.require(:user).permit(:username, :password, :email, :isOfficer)
  end
end

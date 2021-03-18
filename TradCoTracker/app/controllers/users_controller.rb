# frozen_string_literal: true

class UsersController < ApplicationController
  # This controller is what creates the new users for the database

  def index
    @users = User.order('id ASC')
  end

  def show
    @user = User.find(params[:id])
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

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to(user_path(@user))
    else
      render('edit')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(portal_view_members_path)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(portal_view_members_path)
  end

  private

  # These are the parameters for the user
  def user_params
    params.require(:user).permit(:username, :password, :email, :isOfficer)
  end
end

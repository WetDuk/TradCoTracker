# frozen_string_literal: true

class UsersController < ApplicationController
  # This controller is what creates the new users for the database
  skip_before_action :authorized
  def index
    @current_user = User.find_by(id: session[:user_id])
    @users = User.where(['email LIKE ?', "%#{params[:search]}%"])
  end

  # def index
  #   @current_user = User.find_by(id: session[:user_id])

  #   @users = User.order('id ASC')
  # end

  def show
    @current_user = User.find_by(id: session[:user_id])
    @user = User.find(params[:id])
  end

  def new
    @current_user = User.find_by(id: session[:user_id])

    @user = User.new
  end

  # def create
  #  @user = User.new(params[:user])
  #   @user.password = params[:password]
  #  @user.save!
  # end
  def create
    @current_user = User.find_by(id: session[:user_id])

    @user = User.new(user_params)
    @user.email.downcase!
    # If user was able to save return to login
    if @user.save
      redirect_to(root_path)
    else # else reload new user
      redirect_to new_user_path
    end
  end

  # def edit
  #   @current_user = User.find_by(id: session[:user_id])

  #   @user = User.new
  # end

  def update
    @current_user = User.find_by(id: session[:user_id])

    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to(portal_view_members_path)
    else
      render('edit')
    end
  end

  def edit
    @current_user = User.find_by(id: session[:user_id])

    @user = User.find(params[:id])
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(destroy_user_point_path(params[:id]))
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   redirect_to(portal_view_members_path)
  # end

  private

  # These are the parameters for the user
  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation,
                                 :isOfficer)
  end
end

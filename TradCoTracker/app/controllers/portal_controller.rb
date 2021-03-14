# frozen_string_literal: true

class PortalController < ApplicationController
  def index
    redirect_to(controller: 'points')
  end

  def view_members
    @users = User.order('id ASC')
  end

  def new; end

  # creates a new session when the username is in the database and has the same password
  def create
    @user = User.find_by(username: params[:username])
    if !@user.nil? && (@user.password == params[:password])
      # Sudo global variables
      session[:user_id] = @user.id
      session[:user_isOfficer] = @user.isOfficer
      redirect_to point_path(session[:user_id])
    else
      redirect_to root_path
    end
  end

  # destroys the session
  def destroy
    @_current_user = session[:user_id] = nil
    redirect_to root_path
  end
end

# frozen_string_literal: true

class PortalController < ApplicationController
  skip_before_action :authorized, only: %i[login new create destroy]
  @failed = true;
  def home
    @current_user = User.find_by(id: session[:user_id])
    @announcements = Announcement.order('id ASC')
  end

  def view_members
    @users = User.order('id ASC')
    @current_user = User.find_by(id: session[:user_id])
    respond_to do |format|
      format.html
      format.csv  do
        send_data @users.to_csv
      end
    end
  end

  def new 
    @failed = true; 
  end

  def login
    @failed = session["FAILED"];
  end

  # creates a new session when the username is in the database and has the same password
  def create
    @failed = false;
    @user = User.find_by(email: params[:email])
    # Sudo global variables
    if @user&.authenticate(params[:password])
      session["FAILED"] = false
      session[:user_id] = @user.id
      session[:user_isOfficer] = @user.isOfficer
      redirect_to portal_home_path
    else
      session["FAILED"] = true
      redirect_to root_path(true)
    end
  end

  # destroys the session
  def destroy
    @_current_user = session[:user_id] = nil
    redirect_to root_path
  end

  def delete_all
    @current_user = User.find_by(id: session[:user_id])
  end

  def delete_all_announce
    @announce = Announcement.order('id ASC')
    @announce.destroy_all
    redirect_to portal_home_path
  end

  def delete_all_points
    @points = Point.order('id ASC')
    @points.destroy_all
    redirect_to points_path
  end

  def delete_all_users
    @points = Point.order('id ASC')
    @points.destroy_all
    @user = User.order('id ASC')
    @user.destroy_all
    @_current_user = session[:user_id] = nil
    redirect_to root_path
  end
end

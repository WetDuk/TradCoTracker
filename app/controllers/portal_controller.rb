# frozen_string_literal: true

class PortalController < ApplicationController
  skip_before_action :authorized, only: %i[login new create destroy]

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

  def new; end

  # creates a new session when the username is in the database and has the same password
  def create
    @user = User.find_by(email: params[:email])
    # Sudo global variables
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:user_isOfficer] = @user.isOfficer
      redirect_to portal_home_path
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

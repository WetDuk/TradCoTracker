# frozen_string_literal: true

class GroupsController < ApplicationController
  def new
    @current_user = User.find_by(id: session[:user_id])
    @id = session[:user_id]
    @point = Point.new
  end

  def create
    # Instantiate a new object using form parameters
    # @id = session[:user_id]
    # @user = User.find(@id)
    @userstring = point_params[:userID]
    @userarray = @userstring.split(',')
    @userarray.each do |i|
      @point = Point.new(point_params)
      next unless User.find_by email: !i.nil?

      @users = User.find_by email: i
      @point.userID = @users.id
      if @point.save
      else
        # If save fails, redisplay the form so user can fix problems
        render('new')
        logger.debug "test #{i}}"
      end
      # Save the object
    end
    redirect_to(portal_view_members_path)
  end

  private

  def point_params
    params.require(:point).permit(:userID, :eventName, :eventType, :pointAmount,
                                  :submissionDate)
  end
end

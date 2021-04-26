# frozen_string_literal: true

class GroupsController < ApplicationController
  def new
    @current_user = User.find_by(id: session[:user_id])
    @id = session[:user_id]
    @point = Point.new
  end

  def create
    @test = 0
    @current_user = User.find_by(id: session[:user_id])
    # Instantiate a new object using form parameters
    # @id = session[:user_id]
    # @user = User.find(@id)
    @userstring = point_params[:userID]
    @userarray = @userstring.split(',')
    @userarray.each do |i|
      @point = Point.new(point_params)
      @users = User.find_by email: i
      next if @users.nil?

      @point.userID = @users.id
      @test = 1 if @point.save
    end
    # Save the object
    redirect_to(portal_view_members_path) if @test == 1
  end

  private

  def point_params
    params.require(:point).permit(:userID, :eventName, :eventType, :pointAmount,
                                  :submissionDate)
  end
end

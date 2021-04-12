# frozen_string_literal: true

class GroupsController < ApplicationController
    def new
        @current_user = User.find_by(id: session[:user_id])
        @id = session[:user_id]
        @point = Point.new
    end

    def create
        # Instantiate a new object using form parameters
        @id = session[:user_id]
        @user = User.find(@id)
        @point = Point.new(point_params)
        @users = point_params[0]
        @point.userID = User.find_by!(email: @users)
        # Save the object
        if @point.save
            # If save succeeds, redirect to the index action
            redirect_to(portal_view_members_path)
        else
            # If save fails, redisplay the form so user can fix problems
            render('new')
        end
    end

    private

    def point_params
        params.require(:point).permit(:userID, :eventName, :eventType, :pointAmount, :submissionDate)
    end
end

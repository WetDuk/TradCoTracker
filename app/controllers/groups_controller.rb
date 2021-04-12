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
        #@user = User.find(@id)
        @userstring = point_params[:userID]
        @userarray = @userstring.split(",")
        for i in @userarray
            @point = Point.new(point_params)
            @users = User.find_by email: i
            if (@users != nil)
                @point.userID = @users.id
                if(@point.save)
                   @test=1
                else
            #else
            # If save fails, redisplay the form so user can fix problems
            # render('new')
              #  logger.debug "test #{i}}"
                end
            end
        end
        # Save the object
        if(@test==1)
        redirect_to(portal_view_members_path)
        end
    end

    private

    def point_params
        params.require(:point).permit(:userID, :eventName, :eventType, :pointAmount, :submissionDate)
    end
end

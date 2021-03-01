class PortalController < ApplicationController
    def index
        redirect_to(:controller => 'points')
    end 
    def new
    end
    
    def create
        @user = User.find_by(username: params[:username])
        if !!@user
            session[:user_id] = @user.id
            redirect_to points_path
        else
            redirect_to root_path
        end
    end

    def destroy
        @_current_user = session[:user_id] = nil
        redirect_to root_path
    end
end

class PortalController < ApplicationController
    def index
        redirect_to(:controller => 'points')
    end 
    
    def new
    end
    
    #creates a new session when the username is in the database and has the same password
    def create
        @user = User.find_by(username: params[:username])
        if @user && (@user.password == params[:password])
            session[:user_id] = @user.id
            redirect_to points_path
        else
            redirect_to root_path
        end
    end

    #destroys the session
    def destroy
        @_current_user = session[:user_id] = nil
        redirect_to root_path
    end
end

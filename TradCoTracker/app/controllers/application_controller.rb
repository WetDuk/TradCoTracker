class ApplicationController < ActionController::Base
  include Clearance::Controller
    private

    #able to find the current use that is logged in
    def current_user
        if session[:user_id]
            @current_user || User.find(session[:user_id])
        else
            @current_user = nil
        end
    end
end

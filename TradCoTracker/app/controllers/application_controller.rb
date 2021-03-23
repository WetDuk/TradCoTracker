# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  #rescue_from ActionController::RoutingError, with: :routingFix

  def current_user
    if session[:user_id]
      @current_user || User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end


def logged_in?
  !current_user.nil?  
end
def authorized
  redirect_to root_path unless logged_in?
end
private 

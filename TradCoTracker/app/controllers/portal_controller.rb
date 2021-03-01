class PortalController < ApplicationController
    def index
        redirect_to(:controller => 'points')
    end
end

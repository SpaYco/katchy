class SessionsController < ApplicationController
    def new
    end
    def create
        cookies[:id] = params[:id]
        redirect_to users_path
    end
    def destroy
    end
end

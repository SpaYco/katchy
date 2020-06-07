class SessionsController < ApplicationController
    before_action :set_user
    def new
    end
    def create
        cookies[:id] = params[:id]
        redirect_to users_path
    end
    def signout
        cookies[:id] = ""
        redirect_to signin_path
    end
    private
    def set_user
        @current_user = {"name" => "guest"}
    end
end

class SessionsController < ApplicationController
  before_action :set_user
  before_action :logged?, only: %i[new create]
  def new; end

  def create
    if User.where(id: params[:id]).exists?
      cookies[:id] = params[:id]
      redirect_to users_path
    else
      flash[:danger] = 'User doesn\'t exist!'
      redirect_to signin_path
    end
  end

  def signout
    cookies[:id] = ''
    redirect_to signin_path
  end

  private

  # rubocop:disable Style/GuardClause
  def logged?
    if cookies[:id].to_i.positive?
      flash[:success] = 'You\'re Logged In!'
      redirect_to users_path
    end
  end

  # rubocop:enable Style/GuardClause
  def set_user
    @current_user = 'guest'
  end
end

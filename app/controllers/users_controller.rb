class UsersController < ApplicationController
  before_action :logged?
  before_action :set_user
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def login; end

  def signin; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # rubocop:disable Style/GuardClause
  def logged?
    if cookies[:id] == '' || cookies[:id].nil?
      flash[:danger] = 'Please log in.'
      redirect_to signin_path
    end
  end
  # rubocop:enable Style/GuardClause

  def set_user
    @current_user = User.find(cookies[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end

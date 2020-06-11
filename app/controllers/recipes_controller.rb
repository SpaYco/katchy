class RecipesController < ApplicationController
  before_action :logged?
  before_action :set_user
  def index
    @recipes = Recipe.all.includes([:author])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def search
    search = params[:search]
    @recipes = Recipe.where('name LIKE ? OR ingredients LIKE ?', "%#{search}%", "%#{search}%").includes([:author])
  end

  def new
    @recipe = User.first.recipes.new
  end

  def create
    @recipe = @current_user.recipes.new(user_params)
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
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
    params.require(:recipe).permit(:name, :group_id, :amount, :video, :ingredients)
  end
end

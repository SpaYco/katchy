class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = User.first.recipes.new
    end

    def create
        @recipe = User.first.recipes.new(user_params)
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
    def user_params
        params.require(:recipe).permit(:name, :author_id, :group_id, :amount)
    end
end

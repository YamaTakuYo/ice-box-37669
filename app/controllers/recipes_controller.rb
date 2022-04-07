class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
    @recipes = Recipe.all
  end

  
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to refrigerators_index_path
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient, :seasoning, :procedure, :image).merge(user_id: current_user.id)
  end


end

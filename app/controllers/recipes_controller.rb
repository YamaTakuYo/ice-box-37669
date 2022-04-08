class RecipesController < ApplicationController
  
  def index
    @recipe = Recipe.all
    @recipes = Recipe.all
  end

  
  def new
    @recipe = Recipe.new
    ingredients = @recipe.ingredients.build
    seasonings = @recipe.seasonings.build
    procedures = @recipe.procedures.build
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
    params.require(:recipe).permit(:name, :image, 
      ingredients_attributes: [:name, :_destroy, :id], 
      seasonings_attributes: [:name, :_destroy, :id], 
      procedures_attributes: [:name, :_destroy, :id]).merge(user_id: current_user.id)
  end


end

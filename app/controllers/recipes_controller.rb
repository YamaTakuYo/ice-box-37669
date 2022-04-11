class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

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

  def edit
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to refrigerators_index_path
    else
      render :new
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @seasoning = Seasoning.find(params[:id])
    @procedure = Procedure.find(params[:id])
  end
  
  def  destroy
    @recipe.destroy
    redirect_to root_path
  end
  
  def update
    @recipe.update(recipe_params)
    if @recipe.update(recipe_params)
      redirect_to recipe_path
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :image, 
      ingredients_attributes: [:name, :_destroy, :id], 
      seasonings_attributes: [:name, :_destroy, :id], 
      procedures_attributes: [:name, :_destroy, :id]).merge(user_id: current_user.id)
  end


  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end

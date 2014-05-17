class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    authorize @recipes
  end

  def show
    @recipe = Recipe.find(params[:id])

    authorize @recipe
  end
end

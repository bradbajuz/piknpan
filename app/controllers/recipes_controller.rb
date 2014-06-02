class RecipesController < ApplicationController
  respond_to :html, :js

  def index
    #@recipes = Recipe.all.select{|recipe| recipe.matches_pantry(current_user) }
    @recipes = current_user.matched_recipes

    # authorize @recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    # @recipe_weight = current_user.recipe_weights.where("weight > 50").order(weight: :desc)
    authorize @recipe
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredient_lines.build
    @recipe.directions.build
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:notice] = "Recipe was saved successfully."
      # puts "*** #{@recipe.errors.to_yaml}"
    else
      flash[:error] = "Error creating recipe. Please try again."
      # render "recipes/form"
    end

    respond_with(@recipe) do |f|
      f.html { render 'form' }
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description,
      ingredient_lines_attributes: [:ingredient_id, :name, :quantity, :directions, :measurement, :_destroy],
      directions_attributes: [:direction_id, :step, :_destroy])
  end
end

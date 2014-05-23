class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all {|recipe| recipe.matches_pantry (current_user)}

    # authorize @recipes
  end

  def show
    @recipe = Recipe.find(params[:id])

    # @recipe_weight = current_user.recipe_weights.where("weight > 50").order(weight: :desc)

    authorize @recipe
  end
end

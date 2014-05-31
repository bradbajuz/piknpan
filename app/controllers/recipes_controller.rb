class RecipesController < ApplicationController
  respond_to :html, :js

  def index
    @recipes = Recipe.all.select{|recipe| recipe.matches_pantry(current_user) > 25 }.sort_by{|recipe| - recipe.matches_pantry(current_user)}

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
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:notice] = "Recipe was saved successfully."
    else
      flash[:error] = "Error creating recipe. Please try again."
      puts "*** #{@recipe.errors.to_yaml}"
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
      ingredient_lines_attributes: [:ingredient_id, :name, :quantity, :measurement, :directions, :_destroy])
  end
end

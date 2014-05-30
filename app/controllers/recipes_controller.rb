class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.select{|recipe| recipe.matches_pantry(current_user) }.sort_by{|recipe| - recipe.matches_pantry(current_user)}

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
    @recipe.ingredient_lines.build
    @recipe.ingredient_lines.build



  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "Recipe was saved successfully."
    else
      flash[:error] = "Error creating recipe. Please try again."
      render 'form'
    end
  end

  def destroy
    
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description,
      ingredient_lines_attributes: [:ingredient_id, :name, :quantity, :measurement, :directions])
  end
end

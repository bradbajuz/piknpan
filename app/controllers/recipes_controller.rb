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
  end

  def create
    @recipe = Recipe.new(recipe_params)

    puts "*** #{@recipe.errors.to_yaml}"
    if @recipe.save
      redirect_to @recipe, notice: "Recipe was saved successfully."
      puts "*** #{@recipe.errors.to_yaml}"
    else
      flash[:error] = "Error creating recipe. Please try again."
      puts "*** #{@recipe.errors.to_yaml}"
      render 'form'
    end
  end

  def destroy
    
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description,
      ingredient_lines_attributes: [:id, :ingredient_id, :name, :quantity, :measurement, :directions])
  end
end

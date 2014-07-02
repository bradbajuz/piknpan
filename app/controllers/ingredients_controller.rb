class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order(:name).where("name ilike ?", "%#{params[:term]}")
    render json: @ingredients.map(&:name)
  end
end

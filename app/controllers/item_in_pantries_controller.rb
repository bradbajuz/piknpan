class ItemInPantriesController < ApplicationController
  autocomplete :ingredient, :name
  
  def index
    @item_in_pantries = current_user.item_in_pantries

    authorize @item_in_pantries
  end

  def show
    @item_in_pantry = ItemInPantry.find(params[:id])
  end

  def new
    @item_in_pantry = ItemInPantry.new
  end

  def create
    @item_in_pantry = ItemInPantry.new(item_in_pantry_params)
    @item_in_pantry.user = current_user

    if @item_in_pantry.save
      redirect_to item_in_pantries_path, notice: "Item was saved successfully."
      # puts "*** #{@item_in_pantry.errors.to_yaml}"
    else
      flash[:error] = "Error creating item. Please try again."
      render "_form"
    end
  end

  def edit
    @item_in_pantry = ItemInPantry.find(params[:id])
  end

  def update
    @item_in_pantry = ItemInPantry.find(params[:id])

    if @item_in_pantry.update_attributes(item_in_pantry_params)
      redirect_to item_in_pantries_path
    else
      flash[:error] = "Error updating item. Please try again."
      render :edit
    end
  end

  def destroy
    @item_in_pantry = ItemInPantry.find(params[:id])
    name = @item_in_pantry.ingredient.name

    if @item_in_pantry.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to item_in_pantries_path
    else
      flash[:error] = "There was an error deleting \"#{name}\"."
      render "item_in_pantries/index"
    end
  end

private

  def item_in_pantry_params
    params.require(:item_in_pantry).permit(:quantity, :min_quantity, :measurement,
      :location, :ingredient_id, :ingredient_name)
  end
end

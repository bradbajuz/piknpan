class ItemInPantriesController < ApplicationController
  def index
    @item_in_pantries = ItemInPantry.all

    authorize @item_in_pantries
  end

  def show
  end

  def new
    @item_in_pantry = ItemInPantry.new
  end

  def create
    @item_in_pantry = ItemInPantry.new(item_in_pantry_params)
    @item_in_pantry.user = current_user
    

    if @item_in_pantry.save
      redirect_to @item_in_pantry, notice: "Item was saved successfully."
    else
      flash[:error] = "Error creating item. Please try again."
      render 'form'
    end

    def destroy
      
    end
  end

  private

  def item_in_pantry_params
    params.require(:item_in_pantry).permit(:quantity, :min_quantity, :measurement,
      :location, :ingredient_id)
  end
end

class ItemInPantriesController < ApplicationController
  def index
    @item_in_pantries = ItemInPantry.all

    authorize @item_in_pantries
  end

  def show
  end
end

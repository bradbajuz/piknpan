class ItemInPantriesController < ApplicationController
  def index
    @item_in_pantries = ItemInPantry.all
  end

  def show
  end
end

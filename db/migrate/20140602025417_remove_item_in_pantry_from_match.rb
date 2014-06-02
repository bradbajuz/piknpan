class RemoveItemInPantryFromMatch < ActiveRecord::Migration
  def change
    remove_column :matches, :item_in_pantry_id, :string
  end
end

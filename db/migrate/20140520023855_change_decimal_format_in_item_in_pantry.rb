class ChangeDecimalFormatInItemInPantry < ActiveRecord::Migration
  def change
    change_column :item_in_pantries, :quantity, :string
    change_column :item_in_pantries, :min_quantity, :string
  end
end

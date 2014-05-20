class ChangeDecimalFormatInIngredientLine < ActiveRecord::Migration
  def change
    change_column :ingredient_lines, :quantity, :string
  end
end

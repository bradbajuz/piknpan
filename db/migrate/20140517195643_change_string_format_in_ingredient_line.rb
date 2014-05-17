class ChangeStringFormatInIngredientLine < ActiveRecord::Migration
  def change
    change_column :ingredient_lines, :quantity, 'decimal USING CAST(quantity AS decimal)'
  end
end

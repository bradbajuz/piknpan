class AddUnitToIngredientLine < ActiveRecord::Migration
  def change
    add_column :ingredient_lines, :measurement, :string
  end
end

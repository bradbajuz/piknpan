class CreateIngredientLines < ActiveRecord::Migration
  def change
    create_table :ingredient_lines do |t|
      t.string :quantity
      t.string :directions
      t.references :recipe, index: true
      t.references :ingredient, index: true

      t.timestamps
    end
  end
end

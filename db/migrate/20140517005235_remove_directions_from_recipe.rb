class RemoveDirectionsFromRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :directions, :text
  end
end

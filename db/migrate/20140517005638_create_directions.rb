class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.text :steps
      t.references :recipe, index: true

      t.timestamps
    end
  end
end

class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :weight
      t.references :recipe, index: true
      t.references :item_in_pantry, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

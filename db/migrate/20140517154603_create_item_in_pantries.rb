class CreateItemInPantries < ActiveRecord::Migration
  def change
    create_table :item_in_pantries do |t|
      t.decimal :quantity
      t.decimal :min_quantity
      t.string :measurement
      t.string :location
      t.references :ingredient, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

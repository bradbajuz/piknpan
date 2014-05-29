class Ingredient < ActiveRecord::Base
  has_many :item_in_pantries

  # validates :name, length: { minimum: 2 }, presence: true
  # validates :category, length: { minimum: 3 }, if: :category?
  # validates :item_in_pantries, presence: true
end

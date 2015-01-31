class Ingredient < ActiveRecord::Base
  has_many :item_in_pantries
  has_many :ingredient_lines
  has_many :recipes, through: :ingredient_lines

  validates :name, presence: true
  validates :category, length: { minimum: 3 }, if: :category?
end

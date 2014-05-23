class IngredientLine < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  # validates :quantity, length: { minimum: 1 }, presence: true
  # validates :directions, length: { minimum: 10 }, if: :directions?
  # validates :recipe, presence: true
  # validates :ingredient, presence: true
  # validates :measurement, length: { minimum: 1 }, presence: true
end

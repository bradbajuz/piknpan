class IngredientLine < ActiveRecord::Base
  after_save :calculate_matches
  after_destroy :calculate_matches

  belongs_to :recipe
  belongs_to :ingredient

  validates :quantity, length: { minimum: 1 }, presence: true
  validates :directions, length: { minimum: 5 }, if: :directions?
  validates :measurement, length: { minimum: 1 }, presence: true

  def calculate_matches
    match = Match.find_or_create_by(recipe_id: recipe_id, user_id: recipe.user_id)
    match.save
  end
end

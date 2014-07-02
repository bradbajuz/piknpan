class ItemInPantry < ActiveRecord::Base
  after_save :calculate_matches
  after_destroy :calculate_matches

  belongs_to :ingredient
  belongs_to :user

  validates :quantity, length: { minimum: 1 }, presence: true
  validates :min_quantity, length: { minimum: 1 }, if: :min_quantity?
  validates :measurement, length: { minimum: 1 }, presence: true
  validates :location, length: { minimum: 1 }, if: :location?
  validates :ingredient, presence: true
  validates :user, presence: true

  def name
    "#{user.name}: #{ingredient.name}"
  end

  def ingredient_name
    ingredient.try(:name)
  end

  def ingredient_name=(name)
    self.ingredient = Ingredient.find_by_name(name) if name.present?
  end

  def calculate_matches
    ingredient.recipes.where(user_id: user_id).each do |r|
      match = Match.find_or_create_by(recipe_id: r.id, user_id: user_id)
      match.save
    end
  end
end

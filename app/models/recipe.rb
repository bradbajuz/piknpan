class Recipe < ActiveRecord::Base
  has_many :ingredient_lines
  has_many :ingredients, through: :ingredient_lines
  has_many :directions

  def matches_pantry(user)
    count = 0
    ingredients.each do |ingredient|
      count += 1 if ingredient.item_in_pantries.where(user: user).size >= 1
    end
    (count * 100)/ingredients.length
  end

  validates :name, length: { minimum: 2 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true
  validates :ingredient_lines, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true

end

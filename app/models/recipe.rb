class Recipe < ActiveRecord::Base
  has_many :ingredient_lines, dependent: :destroy
  has_many :ingredients, through: :ingredient_lines
  has_many :directions
  accepts_nested_attributes_for :ingredient_lines, allow_destroy: true

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

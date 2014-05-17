class Recipe < ActiveRecord::Base
  has_many :ingredient_lines
  has_many :ingredients, through: :ingredient_lines
  has_many :directions

  validates :name, length: { minimum: 2 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true
  validates :ingredient_lines, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true
end

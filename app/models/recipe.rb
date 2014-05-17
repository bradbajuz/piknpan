class Recipe < ActiveRecord::Base
  has_many :ingredient_lines
  has_many :ingredients, through: :ingredient_lines
  has_many :directions
end

class Recipe < ActiveRecord::Base
  has_many :ingredient_lines
end

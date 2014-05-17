class Ingredient < ActiveRecord::Base
  has_many :item_in_pantries
end

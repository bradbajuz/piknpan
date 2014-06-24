class Match < ActiveRecord::Base
  before_save :matches_pantry

  belongs_to :recipe
  belongs_to :user

  validates :recipe_id, :uniqueness => {scope: :user_id}

  def matches_pantry
    count = 0
    recipe.ingredients.each do |ingredient|
      # This will currently allow items in the pantry set to size 0 to match
      # May need to expand the where to have a greater then 0 for amount in pantry
      count += 1 if ingredient.item_in_pantries.where(user: user).size >= 1
    end
    self.weight = (count * 100)/recipe.ingredients.length
    # rescue ZeroDivisionError
    #   0
    return true # Because this is a before_save filter
   end
end

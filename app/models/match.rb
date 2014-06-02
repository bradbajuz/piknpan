class Match < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :item_in_pantry
  belongs_to :user

  validates :recipe_id, :uniqueness => {scope: :user_id}
end

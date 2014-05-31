class ItemInPantry < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :user
  has_many :matches

  # validates :quantity, length: { minimum: 1 }, presence: true
  # validates :measurement, length: { minimum: 1 }, presence: true
  # validates :location, length: { minimum: 1 }, if: :location?
  # validates :ingredient, presence: true
  # validates :user, presence: true

  def name
    "#{user.name}: #{ingredient.name}"
  end
end

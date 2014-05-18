class ItemInPantry < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :user

  validates :quantity, length: { minimum: 1 }, presence: true
  validates :measurement, length: { minimum: 1 }, presence: true
  validates :location, length: { minimum: 1 }
  validates :ingredient, presence: true
  validates :user, presence: true
end
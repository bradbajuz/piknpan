class Recipe < ActiveRecord::Base
  has_many :ingredient_lines, dependent: :destroy
  has_many :ingredients, through: :ingredient_lines
  has_many :matches
  has_many :directions, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :ingredient_lines, allow_destroy: true
  accepts_nested_attributes_for :directions, allow_destroy: true

  validates :name, length: { minimum: 2 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true
  validates :ingredient_lines, presence: true
  validates :directions, presence: true
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :item_in_pantries, dependent: :destroy
  has_many :recipes
  has_many :matches, -> { order(weight: :desc)}
  has_many :matched_recipes, through: :matches, source: :recipe
end

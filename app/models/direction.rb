class Direction < ActiveRecord::Base
  belongs_to :recipe

  validates :step, length: { minimum: 10 }, presence: true
end

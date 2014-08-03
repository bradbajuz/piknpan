require 'spec_helper'

describe Recipe do
  it "is valid with a name, description, ingredient and direction" do
    recipe = Recipe.new(
      name: 'Coconut Smoothy',
      description: 'Tasty vegan coconut smoothy',
      ingredient: 'Coconut',
      direction: 'Mix coconut with banana')
    expect(recipe).to_be valid
  end

  it "is invalid without a name"

  it "is invalid without a description"

  it "is invalid without a ingredient"

  it "is invalid without a direction"
end
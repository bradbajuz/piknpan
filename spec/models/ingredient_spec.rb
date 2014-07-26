require 'spec_helper'

describe Ingredient do
  it "is valid with a name and category" do
    ingredient = Ingredient.new(
      name: 'Okra',
      category: 'Vegetable')
    expect(ingredient).to be_valid
  end

  it "is invalid without a name" do
    expect(Ingredient.new(name: nil)).to have(2).errors_on(:name)
  end

  it "is valid without a category" do
    expect(Ingredient.new(category: nil)).to have(0).errors_on(:category)
  end

  it "returns a ingredient's full name as a string" do
    ingredient = Ingredient.new(name: 'Okra')
    expect(ingredient.name).to eq 'Okra'
  end

  it "returns a ingredient's full category as a string" do
    ingredient = Ingredient.new(category: 'Vegetable')
    expect(ingredient.category).to eq 'Vegetable'
  end

end
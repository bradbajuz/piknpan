require 'spec_helper'

describe Direction do
  it "is valid with a step" do
    direction = Direction.new(
      step: 'Mix dry batter ingredients')
    expect(direction).to be_valid
  end

  it "is invalid without a step" do
    expect(Direction.new(step: nil)).to have(2).errors_on(:step)
  end

  it "returns a direction's full text as text" do
    direction = Direction.new(step: 'Mix dry batter ingredients')
    expect(direction.step).to eq 'Mix dry batter ingredients'
  end
end
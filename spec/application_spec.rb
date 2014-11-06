require 'spec_helper'

describe IRV do
  ballots = [["R","I","D"], ["R","D","I"],["D","I","R"],["I","D","R"],["I","R","D"],["I","D","R"]]

  it 'can initialize with a ballot' do
    expect(IRV.new(ballots).ballots).to eq(ballots)
  end

  it 'can count the votes for the first round' do
    expect(IRV.new(ballots).count_votes).to eq({"R" => 2, "D" => 1, "I" => 3})
  end

  it 'can find the winner' do
    expect(IRV.new(ballots).final_tally).to eq("I")
  end
end
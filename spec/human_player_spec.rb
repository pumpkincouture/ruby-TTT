require_relative 'spec_helper'

describe HumanPlayer do
  before :each do
    @marker = "$"
    @human_player = HumanPlayer.new(@marker)
  end

  it "identifies human marker" do
    expect(@human_player.marker).to eq("$")
  end
end

require_relative 'spec_helper'

describe Player do

  before :each do
    marker = "$"
    @player = Player.new(marker)
  end

  it "creates a player with a marker" do
    expect(@player.marker).to eq("$")
  end
end

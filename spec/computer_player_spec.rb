require_relative 'spec_helper'

describe ComputerPlayer do
  before :each do
    @marker = "&"
    @computer_player = ComputerPlayer.new(@marker)
    @choice = 3
    @board = Board.new(@choice)
  end

  it "identifies computer marker" do
    expect(@computer_player.marker).to eq("&")
  end

  it "picks a move" do
    @board.cells = ["O", [], "X",
                    "X", "O","O",
                    "X", "O","X"]

    expect(@computer_player.comp_move(@board)).to eq(1)
  end
end

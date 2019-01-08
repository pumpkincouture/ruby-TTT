require_relative 'spec_helper'

describe Rules do
  before :each do
    @board = Board.new(3)
    @rules = Rules.new(@board)
  end

  context "ending the game" do
    it "calls a tie to the game" do
      x_marker = "X"
      o_marker = "O"
      @board.cells = ["#{x_marker}", "#{o_marker}", "#{x_marker}",
               "#{o_marker}", "#{o_marker}", "#{x_marker}",
               "#{x_marker}", "#{x_marker}", "#{o_marker}"]

     player_one_cells = @board.cells_marked_with(x_marker, @board.cells)
     player_two_cells = @board.cells_marked_with(o_marker, @board.cells)

     expect(@rules.game_over?(player_one_cells, player_two_cells)).to be true
    end
  end

  context "finding a winner" do
    it "finds the winner to be marker X" do
      x_marker = "X"
      o_marker = "O"
      cells = ["#{x_marker}", "#{x_marker}", "#{x_marker}",
               "#{o_marker}", "#{o_marker}", [],
               [], [], []]

     player_one_cells = @board.cells_marked_with(x_marker, cells)
     player_two_cells = @board.cells_marked_with(o_marker, cells)

     expect(@rules.winner?(player_one_cells, player_two_cells)).to eq("Player One")
    end

    it "finds the winner to be marker O" do
      x_marker = "X"
      o_marker = "O"
      cells = ["#{o_marker}", "#{o_marker}", "#{o_marker}",
               "#{x_marker}", "#{x_marker}", [],
               [], [], []]

     player_one_cells = @board.cells_marked_with(x_marker, cells)
     player_two_cells = @board.cells_marked_with(o_marker, cells)

     expect(@rules.winner?(player_one_cells, player_two_cells)).to eq("Player Two")
    end
  end
end

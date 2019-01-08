require_relative 'spec_helper'

describe Board do
  let (:board_size) { 3 }
  let (:o_marker) { "O" }
  let (:x_marker) { "X" }

  before :each do
    @board = Board.new(board_size)
  end

  it "creates a board with cells" do
    cells = [[], [], [], [], [], [], [], [], []]

    expect(@board.cells).to eq(cells)
    expect(@board.cells.length).to eq(9)
  end

  it "places a marker in a space" do
    chosen_space = "6"
    cells = [ [], [], [], [], [], "#{o_marker}", [], [], [] ]

    @board.place_move(chosen_space, o_marker)

    expect(@board.cells).to eq(cells)
  end

  it "returns the number of occupied spaces" do
    @board.cells = [[], [], "#{o_marker}",
             [], [], [],
             [], []]

    expect(@board.occupied_spaces.length).to eq(1)
  end

  it "returns the number of open spaces" do
    @board.cells = [[], [], "#{x_marker}",
             [], "#{o_marker}", [],
             [], []]


    expect(@board.open_spaces.length).to eq(6)
  end

  it "returns true if the board is full" do
    @board.cells = ["#{x_marker}", "#{o_marker}", "#{x_marker}",
                     "#{o_marker}", "#{o_marker}", "#{x_marker}",
                     "#{o_marker}", "#{x_marker}","#{o_marker}"]

    expect(@board.full?).to be true
  end

  it "returns false if the board is not full" do
    @board.cells = ["#{x_marker}", "#{o_marker}", "#{x_marker}",
                      "#{o_marker}", "#{o_marker}", "#{x_marker}",
                      "#{o_marker}", [], []]

    expect(@board.full?).to be false
  end

  it "clears the board of a move" do
    @board.cells = ["#{x_marker}", [], [],
                    [], [], [],
                    [], [], []]
    move = 1

    expect(@board.clear_cell(@board.cells, move)).to eq([])
  end
end

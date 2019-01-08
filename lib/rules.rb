class Rules
  attr_accessor :board

  WINNING_COMBOS = [[0,1,2], [3,4,5], [6,7,8],
                    [0,3,6], [1,4,7], [2,5,8],
                    [0,4,8], [2,4,6]]

  def initialize(board)
    @board = board
  end

  def game_over?(player_one_cells, player_two_cells)
    winner?(player_one_cells, player_two_cells) || board.full?
  end

  def winner?(player_one_cells, player_two_cells)
    WINNING_COMBOS.each do |sub_array|
      if sub_array.all? {|x|player_one_cells.include?(x)}
        return "Player One"
      elsif sub_array.all? {|y|player_two_cells.include?(y)}
        return "Player Two"
      end
    end
    return false
  end

  def cells_marked_with(marker, cells)
    spaces = []
    cells.each_with_index do |cell, idx|
      spaces << idx if cell == marker
    end
    spaces
  end
end

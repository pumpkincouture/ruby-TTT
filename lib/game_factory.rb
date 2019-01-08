require_relative 'ui'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'markers'

class GameFactory
  include Markers

  attr_reader :computer_player, :human_player, :ui, :board, :rules

  def create
    @human_player = HumanPlayer.new(MARKERS[0])
    @computer_player = ComputerPlayer.new(MARKERS[1])
    @ui = UI.new
    @board = Board.new(3)
    @rules = Rules.new(@board)
  end
end

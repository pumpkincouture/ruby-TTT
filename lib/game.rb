require_relative 'board.rb'
require_relative 'rules.rb'
require_relative 'computer_player.rb'
require_relative 'human_player.rb'
require_relative 'ui.rb'
require_relative 'markers.rb'
require_relative 'game_factory.rb'

class Game

  attr_reader :human_player, :computer_player, :ui, :board, :rules

  def initialize(human_player, computer_player, user_interface, board, rules)
    @human_player = human_player
    @computer_player = computer_player
    @ui = user_interface
    @board = board
    @rules = rules
  end

  def end_game_message(winning_player)
    @ui.computer_wins if winning_player == "computer"
    @ui.human_wins if winning_player == "human" 
    @ui.cats_game if winning_player == false
  end

  def computer_move(space, marker)
    @board.place_move(space, marker)
    @ui.computer_choice(space)
    @ui.display_board(@board.display_row)
  end

  def user_turn
    @ui.user_prompt
    gets.chomp
  end

  def first_move
    @ui.welcome(@computer_player)
    computer_move(@computer_player.comp_move(@board), @computer_player.marker)
  end

  def play_game
    user_turn
    if @board.invalid_key(@human_player.answer)
      @ui.user_error
    else
      @board.valid_move(@human_player.answer)
      computer_move(@computer_player.comp_move(@board))
    end
  end

  def play!
    first_move
    until @rules.game_over?(@computer_player.marker, @human_player.marker)
      play_game
    end
    end_game_message(@rules.winner?(@computer_player.marker, @human_player.marker))
  end
end

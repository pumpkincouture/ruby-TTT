require './lib/game'
require './lib/game_factory'

game_factory = GameFactory.new

game_factory.create

game = Game.new(game_factory.human_player, game_factory.computer_player, game_factory.ui, game_factory.board, game_factory.rules)

game.play!

require './lib/board.rb'
require './lib/player.rb'
require './lib/rules.rb'
require './lib/computer_player.rb'
require './lib/human_player.rb'
require './lib/ui.rb'
require './lib/game_factory.rb'
require './lib/markers.rb'
# require_relative 'mock_ui'

RSpec.configure do |config|
  config.failure_color = :red
  config.success_color = :green
  config.detail_color = :yellow
  config.tty = true
  config.color = true
  config.formatter = :documentation
  config.order = :rand
end

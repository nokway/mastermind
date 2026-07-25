require_relative 'computer_player'
require_relative 'human_player'
require_relative 'code_class'

class CodeMaker
  attr_accessor :name, :game

  def initialize(name, game)
    @name = name
    @game = game
  end

  def make_code
    if name == 'computer'
      game.code_manager.code = ComputerPlayer.random_guess(game.colors_manager.colors)
    elsif name == 'player'
      game.code_manager.code = HumanPlayer.create_colors
    end
  end
end

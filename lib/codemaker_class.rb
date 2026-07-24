require_relative 'computer_player'
require_relative 'human_player'
require_relative 'code_class'

class CodeMaker
  attr_accessor :name, :game

  def initialize(name, game)
    # @code_manager = CodeManager.new
    @name = name
    @game = game
  end

  def make_code
    if name == 'computer'
      ComputerPlayer.make_code_computer(colors)
    elsif name == 'player'
      game.code_manager.code = HumanPlayer.create_colors
    end
  end
end

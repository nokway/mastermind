# Guess Code
# Second Code to Game
#
require_relative 'code_decoder_class'
require_relative 'codemaker_class'
require_relative 'helpers/computer_algorithm_guess'

# Code Decoder class handling the decoder instance of player
class CodeDecoder
  include ComputerAlgorithm
  attr_accessor :name, :guess

  def initialize(name)
    @name = name
    @guess = ''
  end

  def guess_code_player
    self.guess = HumanPlayer.guess
  end

  def guess_code_computer(amount, colors)
    if amount == 1
      self.guess = ComputerPlayer.random_guess(colors)
    elsif amount > 1
      self.guess = 0 # Unfinished
      # perform the computer filteralgorithm
    end
    # We are going to make it turn based. So I think we will do different actions depending on if its the first round or if its above the first round and we can start to use the algorithm.
  end
end

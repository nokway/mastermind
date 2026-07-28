require_relative 'codemaker_class'
require_relative 'code_decoder_class'

# The playersClass
class PlayersClass
  attr_accessor :code_maker, :code_breaker, :answer, :answer_array, :select_player

  def initialize
    @answer = choose_player
  end
end

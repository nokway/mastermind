# frozen_string_literal: true

require_relative 'codemaker_class'
require_relative 'code_class'
require_relative 'code_decoder_class'
require_relative 'colors_class'
require_relative 'players_class'
require_relative 'helpers/compare_guess_module'
require_relative 'computer_player'
require_relative 'human_player'

# In charge of handling all game events.
class GameManager
  include CompareGuess

  attr_accessor :code_maker, :code, :code_decoder, :maker, :colors, :code_manager, :players_handler, :colors_manager,
                :amount

  def initialize
    @players = [ComputerPlayer.new, HumanPlayer.new]
    @code_maker = CodeMaker.new('none', self)
    @code_decoder = CodeDecoder.new('none')
    @colors_manager = Colors.new
    @code_manager = CodeManager.new('')
    @amount = 1
  end

  def choose_player
    puts 'Do you (Human) want to be the maker or the guesser?'
    if gets.chomp == 'maker'
      %w[player computer]
    else
      %w[computer player]
    end
  end

  def choose_players
    result = choose_player
    code_maker.name = result[0]
    code_decoder.name = result[1]
  end

  def play
    binding.pry
    choose_players
    code_maker.make_code
    loop do
      guess = code_decoder.guessm(amount, colors_manager.colors, code_manager.code)
      if compare_guess_code_win(guess, code_manager.code)
        p 'You win!'
        break
      elsif compare_guess_code_again(guess, code_manager.code, amount)
        self.amount += 1
        p 'Incorrect, guess again'
        p code_decoder.retry(amount, colors_manager.colors, code_manager.code) # SHould implenent, should be like the algorithm array for computer decoder and just another guess for player decoder

      elsif compare_guess_code_lose(guess, code_manager.code, amount)
        p 'Game maker won invalid amount of guessed'
        p "The code was: #{code_manager.code}"
        break
      end
    end
  end

  # yessss this is howww we are going to do ittttt
end

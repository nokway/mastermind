# frozen_string_literal: true

require_relative 'player'
require 'pry-byebug'
require_relative 'helpers/computer_algorithm_guess'
require_relative 'helpers/change_3_module'
require_relative 'helpers/change_2_module'

# The computerPLayer class, handles all things done by the computer player
class ComputerPlayer
  include ComputerAlgorithm
  include ChangeThree
  include ChangeTwo
  def initialize
    @name = 'computer'
    @colored_peg = 0
    @white_peg = 0
    @algorithm_array = %w[nil nil nil nil]
    @filter_array = []
  end
  attr_accessor :algorithm_array, :occupied_places_f, :colored_peg, :white_peg, :occupied_places_h, :colors,
                :filter_array

  def randomizecolors
    new_array = []

    4.times do |i|
      p i
      colors.shuffle!
      new_array.push(colors[i])
    end
    new_array
  end

  def check_conditions_three(array)
    array.count { |item| item == 3 }
  end

  def check_conditions_two(array)
    array.count { |item| item != 1 && item < 4 }
  end

  def free_position(array)
    free = []
    array.each_with_index do |v, i|
      next if v == 1

      free.push(i)
    end
  end

  def sample(array)
    array.sample
  end

  def randomize(algorithm_array)
    sample(algorithm_array)
  end

  def do_condition(filter_three, filter_two, algorithm_array)
    loop do
      if check_conditions_three(algorithm_array).positive?
        # Invoke filter three
      elsif check_conditions_two(algorithm_array) >= 2
        # Invoke filter 2
      end
    end
  end

  def give_hint_white(colors_guessed_array, secret_code_array)
    colors_guessed_array.each_with_index do |v, i|
      secret_code_array.each_with_index do |x, y|
        next unless v == x && i != y && occupied_places_h.include?(i) == false && occupied_places_h.include?(y) == false

        self.white_peg += 1
        occupied_places_h.push(y)
      end
    end

    # Temoporary
    self.occupied_places_h = []
  end

  def self.random_guess(generated_colors)
    new_arr = []
    copy = generated_colors
    4.times do |i|
      copy.shuffle!
      new_arr.push(copy[i])
      # Numbers based sytem where 1 is for similar values and 2 and 3 is for something else? Maybe perform a double filter with 2 methods this one, and then another one for same vaue but different index.
    end
    new_arr
  end

  def perform_filter(player_creation, computer_guess)
    exact_values(computer_guess, player_creation, filter_array, algorithm_array)
    dif_index(computer_guess, player_creation, filter_array, algorithm_array)
    none_index(computer_guess, player_creation, filter_array, algorithm_array)

    algorithm_array
  end

  def apply_new_threes(threes, guess)
    new_guess = guess.clone
    threes.each_pair do |x, y|
      new_guess[x[1]] = y
    end

    new_guess
  end

  def apply_new_twos(twos, guess)
    p 'e'
  end

  def apply_on_algo(algorithm_array, computer_guess, colors, code)
    binding.pry
    new_threes_hash = change_three(computer_guess, algorithm_array, colors)
    new_guess = apply_new_threes(new_threes_hash, computer_guess)
    new_algorithm = perform_filter(code, new_guess)

    # p new_twos_positions = producenew23(new_algo, added_twos)
    # FIX THISSSS AHHHHHHHHHHH
  end

  def to_zero
    self.colored_peg = 0
    self.white_peg = 0
  end

  def give_colors(player_guess, computer_gen)
    give_hint_exact(player_guess, computer_gen)
    give_hint_white(player_guess, computer_gen)
    puts "Colored pegs: #{colored_peg}, White pegs: #{white_peg}"
    to_zero
  end

  def display_colors
    puts 'red blue white yellow green pink black orange brown'
  end
end
# TODO

# Make the shuffler for algorithm
# Check optimizations required
# newGame = ComputerPlayer.new('e', 'e')

# c_guess = %w[blue red yellow red]
# real_t = %w[blue red green yellow]
# index_of_ones = [0, 1]

# algorithm_array = newGame.perform_filter(real_t, c_guess)
# hash = newGame.change_2_and_three(algorithm_array, index_of_ones)
# new_pos = newGame.newpositions23(hash, c_guess)
# p new_pos
# testExact1 = newGame.exact_values(c_guess, real_t)

# testExact = newGame.dif_index(c_guess, real_t)
# p testExact
# p "Algorithm, array #{algorithm_array}"
# indexofones = [1]
# hash = newGame.change_three(c_guess, algorithm_array) # Hash should be {red => newColor, index}
# puts hash
# p hash = newGame.change_2_and_three(algorithm_array, indexofones) #
# p newGame.new_positions(hash, c_guess)
# How change three works:
# For each 3 in algorith marray
# Make a new hash entry wit the orignal color, and a new generated color with its expected placement index in the expected new array consisting of these modified values and filters
# TODO
# mAKE INDEX OF ONES MAKER FUNCTION
# make interpreter for hashes.

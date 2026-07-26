# frozen_string_literal: true

# Handles the change 2 and 3 switcher of values for the computer player
module ChangeTwo
  def change_2_and_three(algorithm_array, index_of_ones)
    # This shows the new positions for 2 and 3
    storage_position = 0
    occupied_positions = []
    storage_hash = {}
    algorithm_array.each_with_index do |v, i|
      next unless [2, 3].include?(v)

      storage_position = generate_new_position(occupied_positions, index_of_ones, i)
      occupied_positions.push(storage_position)

      storage_hash[[v, i]] = storage_position
    end
    storage_hash
  end

  def generate_new_position(occupied_positions, index_of_ones, current_position)
    loop do
      new_position = [0, 1, 2, 3].sample
      if occupied_positions.include?(new_position) == false && index_of_ones.include?(new_position) == false && new_position != current_position
        return new_position
      end

      next
    end
  end

  def newpositions23(hash, comp_guess)
    new_array = []
    hash.each_pair do |key, value|
      index = key[1]
      value_c = comp_guess[index]

      new_array[value] = value_c
    end
    new_array
  end

  def index_of_ones(algorithm_array)
    new_array = []
    algorithm_array.each_with_index do |v, i|
      new_array.push(i) if v == 1
    end
    new_array
  end

  def producenew23(algorithm_array, comp_guess)
    ones = index_of_ones(algorithm_array)
    hash = change_2_and_three(algorithm_array, ones)
    newpositions23(hash, comp_guess)
  end
end

# How to call
# We need the guess, algorithm array etc.
# Then we just say guess = this value or whatever, (but after applying the change all 3 thingy )and then we simply produce a new array, maybe change the value of the cimputer guess to this array
# and send it over to the main game which is going to check if it was correct or not and then if its computer we just do the methods again
# so probably easier to make a method in game-manager  for doing this entire process or somwhere else idk  maybe in code decoder
# Questions:
# should c ode maker the be the one to check if it was correct or game?

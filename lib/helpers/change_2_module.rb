# frozen_string_literal: true

# Handles the change 2 and 3 switcher of values for the computer player
module ChangeThree
  def change_2_and_three(algorithm_array, index_of_ones)
    # This shows the new positions for 2 and 3
    storage_position = 0
    occupied_positions = []
    storage_hash = {}
    algorithm_array.each_with_index do |v, i|
      next unless [2, 3].include?(v)

      storage_position = generate_new_position(occupied_positions, index_of_ones, i)
      occupied_positions.push(storage_position)

      storageHash[[v, i]] = storage_position
    end
    storageHash
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
    hash = change_2_and_three(algorithm_array, index_of_ones)
    new_positions = newpositions23(hash)
  end
end

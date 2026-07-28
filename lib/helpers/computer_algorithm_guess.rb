# frozen_string_literal: true

# Some helper functions for the computer_guesser
module ComputerAlgorithm
  def exact_values(computer_guess, player_creation, filter_array, algorithm_array)
    computer_guess.each_with_index do |v, i|
      player_creation.each_with_index do |x, y|
        next unless v == x && i == y

        break if both_qualified(filter_array, i, y) == false

        algorithm_array[i] = 1
        filter_array.push([i, y])
      end
    end
  end

  def dif_index(computer_guess, player_creation, filter_array, algorithm_array)
    computer_guess.each_with_index do |v, i|
      player_creation.each_with_index do |x, y|
        next unless v == x && i != y

        break if both_qualified(filter_array, i, y) == false

        algorithm_array[i] = 2
        filter_array.push([i, y])
      end
    end
  end

  def none_index(computer_guess, player_creation, filter_array, algorithm_array)
    computer_guess.each_with_index do |v, i|
      player_creation.each_with_index do |x, y|
        next unless v != x

        next if filter_array.any? { |v| v[0] == i || v[1] == y }

        algorithm_array[i] = 3

        filter_array.push([i, y])
      end
    end
  end

  def both_qualified(filter_array, i_val, y_val)
    return false if filter_array.any? { |v1| v1[1] == y_val || v1[0] == i_val }

    true
  end
end

# frozen_string_literal: true

# Module helper for handling the give hints
module GiveHint
  def exact_values_hint(player_guess, computer_creation, filter_array_h)
    color_pegs = 0
    player_guess.each_with_index do |v, i|
      computer_creation.each_with_index do |x, y|
        next unless v == x && i == y

        break if both_qualified_exact(player_guess, computer_creation, filter_array_h, i, y) == false

        color_pegs += 1
        filter_array_h.push([i, y])
      end
    end
    color_pegs
  end

  def give_hint_white(player_guess, computer_creation, filter_array_h)
    white_peg = 0
    player_guess.each_with_index do |v, i|
      computer_creation.each_with_index do |x, y|
        next unless v == x && i != y

        break if both_qualified_exact(player_guess, computer_creation, filter_array_h, i, y) == false

        white_peg += 1
        filter_array_h.push([i, y])
      end
    end

    # Temoporary
    self.occupied_places_h = []
    white_peg
  end

  def both_qualified_exact(player_guess, computer_creation, filter_array_h, i_val, y_val)
    return false if filter_array_h.any? { |v1| v1[1] == y_val || v1[0] == i_val }

    true
  end

  # def both_qualified_white(player_guess, computer_creation, filter_array_h)
  #   player_guess.each_with_index do |v, i|
  #     computer_creation.each_with_index do |x, y|
  #       next unless v == x && i != y
  #       break if filter_array_h.any? { |v1| v1[1] == y || v1[0] == i }

  #       return true
  #     end
  #   end
  #   false
  # end
end

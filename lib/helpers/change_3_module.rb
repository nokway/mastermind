module ChangeThree
  def change_three(computer_guess, algorithm_array, colors)
    # Changes all the threes
    occupied_colors = []
    storage_hash = {}
    new_color = ''
    algorithm_array.each_with_index do |v, i|
      next unless v == 3

      occupied_colors.push(v)
      original_color = computer_guess[i]
      new_color = new_colors(colors, original_color, occupied_colors)

      occupied_colors.push(new_color)
      storage_hash[[original_color, i]] = new_color
    end
    storage_hash
  end

  def new_colors(colors, original_color, occupied_colors)
    loop do
      new_color = colors.sample
      return new_color if new_color != original_color && occupied_colors.include?(new_color) == false
    end
  end

  # def new_threes(hash)
  #   new_array = []
  #   hash.each_pair do |v, i|
  #     index = v[1]

  #     new_array[index] = i
  #   end
  #   new_array
  # end

  # def perform_filters(computer_guess, algo_array, colors)
  #   hash = change_three(computer_guess, algo_array, colors)
  #   new_threes(hash)
  # end
end

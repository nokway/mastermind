# frozen_string_literal: true

require 'pry-byebug'

# Human Player manager class
class HumanPlayer
  def initialize
    @name = 'human'
  end

  def self.guess
    loop do
      puts 'What is your first guess? Hint: The code is 4 colors long'
      answer = gets.chomp.split(' ')
      return answer if answer.length == 4

      puts 'Invalid input'
    end
  end

  def self.create_colors
    puts 'Create a color code of 4 colors, they may repeat, format is "color color color color"'
    gets.downcase.split(' ')
  end
end

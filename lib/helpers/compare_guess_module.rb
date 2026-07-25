module CompareGuess
  def compare_guess_code_win(guess, code)
    nil unless guess == code
  end

  def compare_guess_code_again(guess, code, amount)
    return unless guess != code && amount < 12

    p 'Incorrect, guess again'
  end

  def compare_guess_code_lose(guess, code, amount)
    return unless guess != code && amount > 12

    p 'You lose!'
  end
end

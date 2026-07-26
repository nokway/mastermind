module CompareGuess
  def compare_guess_code_win(guess, code)
    return unless guess == code

    true
  end

  def compare_guess_code_again(guess, code, amount)
    return unless guess != code && amount < 12

    true
  end

  def compare_guess_code_lose(guess, code, amount)
    return unless guess != code && amount > 12

    true
  end
end

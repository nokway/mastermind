module Indexes
  def index_of_ones(algorithm_array)
    new_array = []
    algorithm_array.each_with_index do |v, i|
      new_array.push(i) if v == 1
    end
    new_array
  end

  def index_of_threes(algorithm_array)
    new_array = []

    algorithm_array.each_with_index do |v, i|
      new_array.push(i) if v == 3
    end
    new_array
  end
end

# TODO
#
# Make this so that we can use the conditional method for the specific filter to use (either on the threes or change the twos positions in computer pyaer )
# should just give the indexes of the threes and the ones
# Reason:
# We want to avoid making a new position that is already occupied by 1 or 3 because we only want to move the  2's

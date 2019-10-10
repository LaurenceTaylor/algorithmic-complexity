class Array
  def new_shuffle
    initial_array = clone
    result = []
    until initial_array.empty?
      i = rand(initial_array.length)
      result << initial_array[i]
      initial_array[i] = initial_array.last
      initial_array.pop
    end
    result
  end
end

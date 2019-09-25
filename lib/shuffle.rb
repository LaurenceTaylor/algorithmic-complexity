class Array
  def new_shuffle
    initial_array = clone
    result = []
    while initial_array.any?
      i = rand(initial_array.length)
      result.prepend(initial_array[i])
      initial_array.delete_at(i)
    end
    result
  end
end

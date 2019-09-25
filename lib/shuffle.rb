class Array
  def shuffle
    initial_array = self.clone
    result = []
    while initial_array.any? do
      i = rand(initial_array.length)
      result.prepend(initial_array[i])
      initial_array.delete_at(i)
    end
    result
  end
end

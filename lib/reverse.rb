class Array
  def new_reverse
    each_with_object([]) { |e, arr| arr.prepend(e) }
  end
end

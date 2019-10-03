class Array
  def find_duplicates
    frequencies = {}
    result = []
    each do |word|
      frequencies[word].nil? ? frequencies[word] = 1 : frequencies[word] += 1
      result << word if frequencies[word] == 2
    end
    result
  end
end

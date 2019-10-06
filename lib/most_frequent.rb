class Array
  def most_frequent
    frequencies = {}
    result = [nil, nil]

    each do |word|
      frequencies[word].nil? ? frequencies[word] = 1 : frequencies[word] += 1
    end

    highest = frequencies.values.sort.reverse

    frequencies.keys.each do |word|
      if frequencies[word] == highest[0] && result[0].nil?
        result[0] = word
      elsif frequencies[word] == highest[1]
        result[1] = word
      end
    end

    result
  end
end

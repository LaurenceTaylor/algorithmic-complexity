require 'most_frequent'

describe Array do
  describe '#most_frequent' do
    it 'returns the two most frequent words in an array' do
      expect(['hi', 'hi', 'bye', 'bye', 'yes'].most_frequent).to eq(['hi', 'bye'])
    end

    it 'returns the two most frequent words in an array' do
      expect(['hi', 'hi', 'yes', 'yes', 'bye'].most_frequent).to eq(['hi', 'yes'])
    end
  end
end

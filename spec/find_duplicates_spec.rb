require 'find_duplicates'

describe Array do
  describe '#find_duplicates' do
    it 'should find all duplicate words in an array' do
      expect(['hi', 'hi', 'bye', 'bye'].find_duplicates).to eq(['hi', 'bye'])
    end

    it 'should find all duplicate words in an array in order found' do
      expect(['hi', 'bye', 'bye', 'hi'].find_duplicates).to eq(['bye', 'hi'])
    end

    it 'should return an empty array when there are no duplicates' do
      expect(['hi', 'bye'].find_duplicates).to eq([])
    end
  end
end

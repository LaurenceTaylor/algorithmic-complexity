require 'reverse'

describe Array do
  describe '#new_reverse' do
    it 'reverse the order of an array' do
      expect([1, '2', :c, 4, '5'].new_reverse).to eq(['5', 4, :c, '2', 1])
    end

    it 'should handle empty arrays' do
      expect([].new_reverse).to eq([])
    end
  end
end

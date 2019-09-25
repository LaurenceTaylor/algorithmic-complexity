require 'shuffle'

describe Array do
  describe '#new_shuffle' do
    it('should randomly rearrange an array of ints') do
      allow_any_instance_of(Object).to receive(:rand).and_return(0)
      expect([1, 2, 3, 4, 5, 6, 7, 8, 9].new_shuffle).to eq([9, 8, 7, 6, 5, 4, 3, 2, 1])
    end

    it('does not just reverse/ order the array') do
      shuffled = [1, 2, 3, 4, 5, 6, 7, 8, 9].new_shuffle
      while shuffled == [9, 8, 7, 6, 5, 4, 3, 2, 1]
        shuffled = shuffled.new_shuffle
      end
      expect(shuffled).not_to eq([9, 8, 7, 6, 5, 4, 3, 2, 1])
    end

    it('should handle empty arrays') do
      expect([].new_shuffle).to eq([])
    end
  end
end

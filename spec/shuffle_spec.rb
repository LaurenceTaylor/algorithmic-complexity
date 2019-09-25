require 'shuffle'

describe Array do
  describe '#shuffle' do
    before(:each) do
      allow_any_instance_of(Object).to receive(:rand).and_return(0)
    end

    it('should randomly rearrange an array of ints') do
      expect([1, 2, 3, 4, 5].shuffle).to eq([5, 4, 3, 2, 1])
      expect(['a', 'b', 'c', 'd', 'e'].shuffle).to eq(['e', 'd', 'c', 'b', 'a'])
      expect([:a, :b, :c, :d, :e].shuffle).to eq([:e, :d, :c, :b, :a])
      expect([1, 'b', :c, 4, 'e'].shuffle).to eq(['e', 4, :c, 'b', 1])
    end

    it('should work with empty arrays') do
      expect([].shuffle).to eq([])
    end
  end
end

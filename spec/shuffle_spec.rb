require 'shuffle'

describe Array do
  describe '#shuffle' do
    before(:each) do
      allow_any_instance_of(Object).to receive(:rand).and_return(0)
    end

    it('should randomly rearrange an array of ints') do
      input_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expected_output = [9, 8, 7, 6, 5, 4, 3, 2, 1]
      expect(input_array.shuffle).to eq(expected_output)
    end

    it('should randomly rearrange an array of strings') do
      input_array = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
      expected_output = ['9', '8', '7', '6', '5', '4', '3', '2', '1']
      expect(input_array.shuffle).to eq(expected_output)
    end
  end
end

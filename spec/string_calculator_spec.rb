RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'with an empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'with a comma alone' do
      it 'raises invalid input exception' do
        expect { calculator.add(',') }.to raise_error(StandardError, 'invalid input')
      end
    end

    context 'with one number' do
      it 'returns the number itself' do
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'with two comma-separated numbers' do
      it 'returns the sum of the numbers' do
        expect(calculator.add('1,2')).to eq(3)
      end
    end

    context 'with any amount of numbers' do
      it 'returns the sum of the numbers' do
        expect(calculator.add('1,2,3,4,5,6,7')).to eq(28)
      end
    end

    context 'with numbers separated by newline and comma' do
      it 'returns the sum of the numbers' do
        expect(calculator.add('1\n2,3')).to eq(6)
      end
    end

    context 'with invalid input' do
      it 'raises invalid input exception' do
        expect { calculator.add('1,\n') }.to raise_error(StandardError, 'invalid input')
      end
    end

    context 'with negative input' do
      it 'raises negative number exception' do
        expect { calculator.add('-1') }.to raise_error(StandardError, 'negative numbers are not allowed -1')
      end
    end

    context 'with multiple negative input' do
      it 'raises negative numbers exception' do
        expect { calculator.add('-1, -2') }.to raise_error(StandardError, 'negative numbers are not allowed -1, -2')
      end
    end

    context 'with numbers greater than 1000 should be ignored' do
      it 'returns the sum of the numbers that are lesser or equal to 1000' do
        expect(calculator.add('1\n2,1003,1000,1002,3')).to eq(1006)
      end
    end

    context 'with a custom delimiter' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'with custom delimiter of any length' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context 'with multiple delimiters' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end

    context 'with multiple delimiters of any length' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//[**][%%%]\n1**2%%%3")).to eq(6)
      end
    end
  end
end

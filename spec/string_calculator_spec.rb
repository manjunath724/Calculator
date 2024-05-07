RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'with an empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
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
  end
end

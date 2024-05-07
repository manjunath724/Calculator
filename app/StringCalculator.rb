class StringCalculator
  def add(numbers)
    numbers.split(',').map(&:to_i).inject(0) do |sum, num|
      sum + num
    end
  end
end

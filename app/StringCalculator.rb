class StringCalculator
  def add(numbers)
    numbers.gsub!('\n', ',')
    numbers.split(',').map(&:to_i).inject(0) do |sum, num|
      sum + num
    end
  end
end

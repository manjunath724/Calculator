class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    numbers.gsub!('\n', ',')

    validate_size(numbers)

    numbers.split(',').map(&:to_i).inject(0) do |sum, num|
      sum + num
    end
  end

  private

  def validate_size(numbers)
    numbers_count = numbers.scan(/\d+/).size
    commas_count = numbers.scan(/,/).size
    raise StandardError.new('Invalid Input') unless numbers_count > commas_count
  end
end

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    replace_delimiter(numbers)
    validate_size(numbers)
    validate_negative(numbers)

    numbers.split(',').map(&:to_i).inject(0) do |sum, num|
      sum + (num <= 1000 ? num : 0)
    end
  end

  private

  def replace_delimiter(numbers)
    # Extract content between // and \n within a string
    delimiter = numbers.match(/^\/\/(.*?)\n/) { $1 }

    # If different delimiters are present
    replace_match(numbers, delimiter) unless delimiter.nil?

    numbers.gsub!("\n", ',')                      # Replace newline character with comma(,) otherwise
  end

  def replace_match(numbers, delimiter)
    numbers.gsub!("//#{delimiter}\n", '')         # Remove the first line containing delimiter information from the input string
    delimiter.gsub!('[','')                       # If delimiters are enclosed in big brackets then remove opening braces
    delimiters = delimiter.split(']')             # Split the remaining string by closing braces
    delimiters.map { |d| numbers.gsub!(d, ',') }  # For each matching delimiter, replace the occurrences in input string
  end

  def validate_size(numbers)
    numbers_count = numbers.scan(/\d+/).size
    commas_count = numbers.scan(/,/).size
    raise StandardError.new('invalid input') unless numbers_count > commas_count
  end

  def validate_negative(numbers)
    negatives = numbers.scan(/-\d+/)
    raise StandardError.new("negative numbers are not allowed #{negatives.join(', ')}") unless negatives.empty?
  end
end

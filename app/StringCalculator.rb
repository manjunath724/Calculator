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

  def validate_size(numbers)
    numbers_count = numbers.scan(/\d+/).size
    commas_count = numbers.scan(/,/).size
    raise StandardError.new('invalid input') unless numbers_count > commas_count
  end

  def validate_negative(numbers)
    negatives = numbers.scan(/-\d+/)
    raise StandardError.new("negative numbers are not allowed #{negatives.join(', ')}") unless negatives.empty?
  end

  def replace_delimiter(numbers)
    delimiter = numbers.match(/^\/\/(.*?)\n/) { $1 }

    unless delimiter.nil?
      numbers.gsub!("//#{delimiter}\n", '')
      delimiter.gsub!('[','')
      delimiters = delimiter.split(']')
      delimiters.map { |d| numbers.gsub!(d, ',') }
    end

    numbers.gsub!('\n', ',')
  end
end

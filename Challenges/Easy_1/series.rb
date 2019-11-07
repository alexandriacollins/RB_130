class Series
  attr_reader :digits

  def initialize(digits) #input -> string of digits
    @digits = digits.chars.map(&:to_i) 
  end

  def slices(n) # output of this method -> all possible consecutive number series of length n in @str_of_digits
    raise ArgumentError if n > digits.size
    arr = []
    digit_arr.each_index do |index|
      nums = digit_arr[index, n]
      arr << nums unless nums.size < n
    end
    arr
  end
end
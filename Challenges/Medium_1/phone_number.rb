# Less than 10 digits assume = bad number
# 10 digits assume = good number
# 11 digits and the first number is 1, trim the 1 and use the last 10 digits
# 11 digits and the first number is not 1 = bad number
# More than 11 digits assume that it is a bad number

class PhoneNumber
  def initialize(number)
    @number = number
  end

  def number
    return "0000000000" if @number.count("a-zA-Z") > 0 

    @number = @number.gsub(/[^0-9]/, "")

    if @number.size < 10 || (@number.size == 11 && @number[0] != '1') || @number.size > 11
      "0000000000"
    elsif @number.size == 11 && @number[0] == '1'
      @number[1..-1]
    else
      @number
    end
  end

  def area_code
    updated_num = number
    updated_num[0, 3]
  end

  def to_s
    updated_num = number
    "(#{updated_num[0, 3]}) #{updated_num[3, 3]}-#{updated_num[6, 4]}"
  end
end
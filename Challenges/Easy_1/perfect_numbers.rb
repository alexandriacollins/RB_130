class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 0

    divisors = []
    1.upto(num - 1).each {|number| divisors << number if num % number == 0}

    if divisors.sum == num
      "perfect"
    elsif divisors.sum >= num
      "abundant"
    elsif divisors.sum <= num
      "deficient"
    end
  end
end
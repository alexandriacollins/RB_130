class Prime
  def self.nth(nth_num)
    raise ArgumentError if nth_num == 0

    primes_list = []
    number = 2
    #iterator that stops when list.size == number
    loop do 
      primes_list << number if self.prime?(number)
      break if primes_list.size == nth_num
      number += 1
    end

    primes_list.last
  end

  def self.prime?(number)
    divisors = []
    1.upto(number) do |num|
      divisors << num if number % num == 0
      break if divisors.size > 2
    end

    divisors.size == 2
  end
end

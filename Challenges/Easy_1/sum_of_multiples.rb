# find sum of all the multiples of particular numbers, up to but not including that number
require 'pry'
class SumOfMultiples
  def initialize(*mult)
    @mult = mult 
  end

  def self.to(num, multiples = [3, 5])
    sum_arr = []
    (1...num).to_a.each do |number|
      sum_arr << number if multiples.any?{|mult| number % mult == 0}
    end
    sum_arr.sum
  end

  def to(num)
   self.class.to(num, @mult)
  end
end

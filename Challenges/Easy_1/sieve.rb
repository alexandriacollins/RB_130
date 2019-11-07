class Sieve
  MARKED = "X"
  UNMARKED = ""
  def initialize(limit)
    @range = (2..limit).to_a
  end

  def primes
    primes = @range.each_with_object({}){|num, hash| hash[num] = UNMARKED}

    primes.each do |key1, value1|
      if value1 == UNMARKED
        primes.each do |key2, value2|
          primes[key2] = MARKED if key2 / key1 > 1 && key2 % key1 == 0
        end
      end
    end
    primes.select{|_, k| k == UNMARKED}.keys
  end
end
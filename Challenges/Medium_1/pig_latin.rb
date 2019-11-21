require 'pry'
class PigLatin
  ALPHABET = ('a'..'z').to_a
  VOWELS = %w(a e i o)
  CONSONANTS = ALPHABET - VOWELS

  def self.translate(str)
    new_word = str.split(" ").map do |word|
      self.pigify(word)
    end

    new_word.join(" ")
  end

  def self.pigify(word)
    if VOWELS.include?(word[0])
      word << "ay"
    else
      word = word.chars
      loop do 
        first = word.shift
        word.push(first)
        #binding.pry
        break if VOWELS.include?(word[0]) || (word.none?{|letter| VOWELS.include?(letter)} && word[0] == "u")
      end 
      word << "ay"
      word.join
    end
  end
end

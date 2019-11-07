# given a word and a list of possible anagrams
# output selects the correct sublist that contains the anagrams of the word 

class Anagram
  def initialize(word)
    @word = word
    @letters = sort(@word)
  end

  def match(arr)
    arr.sort.select {|word| anagram?(word)}
  end

  private
  def anagram?(word)  
    @letters == sort(word) && @word != word.downcase
  end

  def sort(str)
    str.downcase.chars.sort
  end
end

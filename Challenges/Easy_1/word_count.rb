class Phrase
  def initialize(str)
    @words = str.downcase.downcase.delete('^a-z0-9 ').squeeze(" ").split(" ")
  end

  def word_count
    @words.each_with_object({}) do |word, hash|
      if hash[word] != nil
        hash[word] += 1
      else
        hash[word] = 1
      end
    end
  end
end

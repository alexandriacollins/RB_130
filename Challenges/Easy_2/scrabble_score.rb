class Scrabble
  LETTER_VALUES = {}
  %w(A E I O U L N R S T).each {|letter| LETTER_VALUES[letter] = 1}
  %w(D G).each {|letter| LETTER_VALUES[letter] = 2}
  %w(B C M P).each {|letter| LETTER_VALUES[letter] = 3}
  %w(F H V W Y).each {|letter| LETTER_VALUES[letter] = 4}
  %w(K).each {|letter| LETTER_VALUES[letter] = 5}
  %w(J X).each {|letter| LETTER_VALUES[letter] = 8}
  %w(Q Z).each {|letter| LETTER_VALUES[letter] = 10}

  def initialize(word)
    @word = word
  end

  def score(word = @word)
    return 0 if word == nil
    word = word.upcase.gsub(/[^A-Z]/, "").chars
    score = 0
    word.each do |letter|
      score += LETTER_VALUES[letter]
    end
    score
  end

  def self.score(word)
    self.new(word).score
  end
end

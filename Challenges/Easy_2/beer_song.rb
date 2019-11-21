
class BeerSong
  def verse(num)
    @num = num
    verse = "#{@num if @num >= 1} #{cap if @num == 0}#{bottles if @num >= 1} of beer on the wall, #{@num if @num >= 1} #{bottles} of beer.\n".squeeze(" ").lstrip
    @num -= 1
    verse += "#{last_line}".squeeze(" ")
  end

  def verses(*nums)
    result = ""
    nums[0].downto(nums[-1]) do |number| 
      result += verse(number)
      result += "\n" unless nums[-1] == number
    end
    result
  end

  def lyrics
    verses(99, 0)
  end

  def last_line
    if @num > -1
      "Take #{one} down and pass it around, #{@num if @num >= 1} #{bottles} of beer on the wall.\n"
    else
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def bottles
    if @num > 1
      "bottles"
    elsif @num == 1
      "bottle"
    else
      "no more bottles"
    end
  end

  def cap
    bottles.split(" ")[0].capitalize + " more bottles"
  end

  def one
    @num > 0 ? "one" : "it"
  end
end

# puts BeerSong.new.verses(2, 0)


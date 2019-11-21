# Takes a decimal number
# Converts number to appropiate sequence of events for secret handshake 
  #(Convert number into binary and match sequence)
  # Invalid binart should be value 0 
require 'pry'

class SecretHandshake
  EVENTS = {
    "1" => "wink", "10" => "double blink", "100" => "close your eyes", "1000" => "jump"
  }

  def initialize(num)
    @num = num.to_i.to_s(2)
  end

  def commands
    sequence = []
    digits = @num.chars
    digits.size.times do |index|
      #binding.pry
      range = digits[-index - 1..-1].join
      sequence << EVENTS[range] if EVENTS.keys.include?(range)
      digits[-index - 1] = "0"
    end

    digits.size == 5 ? sequence.reverse! : sequence
  end
end

handshake = SecretHandshake.new(3)
p handshake.commands

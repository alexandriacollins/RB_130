# Medium 1 - Problem Set
#-------------------------
#1 Listening Device
# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     return unless block_given?
#     recording = yield
#     record(recording)
#   end

#   def play
#     puts @recordings.last
#   end
# end

# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# p listener.play # Outputs "Hello World!"

#2 Text-Analyzer - Sandwich Code
# class TextAnalyzer
#   def process
#     file = File.open('sample.txt', 'r')
#     yield(file.read)
#     file.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process {|text| puts "#{text.split("\n\n").count} paragraphs"}
# analyzer.process {|text| puts "#{text.split("\n").count} lines"}
# analyzer.process {|text| puts "#{text.split(' ').count} words" }

#3 Passing Paramters Part 1
# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# gather(items){|produce| puts produce.join('; ')}

#4 Passing Paramters Part 2
# birds = ['crow', 'finch', 'hawk', 'eagle']
# def types(birds)
#   yield(birds)
# end

# types(birds) do |_,_,*raptors|
#   puts "Raptors: #{raptors.join(', ')}."
# end

#5 Passing Paramters Part 3
# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

# gather(items) do |*foods, wheat|
#   puts "#{foods.join(', ')}"
#   puts wheat
# end

# gather(items) do |apple, *foods, wheat|
#   puts apple
#   puts "#{foods.join(", ")}"
#   puts wheat
# end

# gather(items) do |apple, *foods|
#   puts apple
#   puts "#{foods.join(", ")}"
# end

# gather(items) do |apple, corn, cabbage, wheat|
#   puts apple + ", " + corn + ", " + cabbage + ", " + wheat
# end

#6 Method to Proc 
def convert_to_base_8(n)
  n.method_name.method_name # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(argument).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
[8, 10, 12, 14, 16, 33].map(&a_proc)
#7 Buddle Sort with Blocks 
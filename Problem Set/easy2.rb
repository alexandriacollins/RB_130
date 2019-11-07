# Easy 2 - Problem Set
#---------------------
#1 From-To-Step Sequence Generator
# def step(start_num, end_num, step_num)
#   current_value = start_num
#   loop do
#     yield(current_value)
#     break if current_value + step_num > end_num
#     current_value += step_num
#   end
#   current_value
# end

# step(1, 10, 3) { |value| puts "value = #{value}" }

#2 Zipper
# def zip(arr1, arr2)
#   new_arr = []
#   arr1.each_with_index {|element, index| new_arr << [element, arr2[index]]}
#   new_arr
# end

# p zip([1, 2, 3], [4, 5, 6])

#3 map
# def map(arr)
#   new_arr = []
#   arr.each {|element| new_arr << yield(element)}
#   new_arr
# end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

#4 count
# def count(*num_of_args)
#   count = 0
#   num_of_args.each {|element| count += 1 if yield(element)}
#   count
# end

# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3

#5 drop_while
# def drop_while(arr)
#   new_arr = []
#   arr.each do |element|
#     if yield(element)
#       new_arr << element
#     else
#       break
#     end
#   end
#   arr - new_arr
# end
# p drop_while([1, 3, 5, 6]) { |value| value.odd? } #== [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } #== [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } #== []
# p drop_while([1, 3, 5, 6]) { |value| false } #== [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } #== [5, 6]
# p drop_while([]) { |value| true } #== []

#6 each_with_index
# def each_with_index(arr)
#   index = 0 
#   arr.each do |element|
#     yield(element, index)
#     index += 1
#   end
# end

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]

#7 each_with_object
# def each_with_object(arr, obj)
#   arr.each {|item| yield(item, obj)}
#   obj
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}

#8 max_by
# def max_by(arr)
#   return nil if arr.empty?
#   max = arr.first
#   largest = yield(max)

#   arr[1..-1].each do |item|
#     yielded_value = yield(item)
#     if largest < yielded_value
#       largest = yielded_value
#       max = item
#     end
#   end
#   max
# end

# p max_by([1, 5, 3]) { |value| value + 2 } #== 5
# p max_by([1, 5, 3]) { |value| 9 - value } #== 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil

#9 each_cons (Part 1)
# def each_cons(arr, n)
#   arr.each_index do |index|
#     break if index + (n - 1) >= arr.size
#     yield(*arr[index..(index + n - 1)])
#   end
#   nil
# end
# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# p result == nil
# p hash #== { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {}
# p result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash #== {'a' => 'b'}
# p result == nil

#10 each_cons (Part 2)
# hash = {}
# each_cons([1, 3, 6, 10], 1) do |value|
#   hash[value] = true
# end
# p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

# hash = {}
# each_cons([1, 3, 6, 10], 2) do |value1, value2|
#   hash[value1] = value2
# end
# p hash #== { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# each_cons([1, 3, 6, 10], 3) do |value1, *values|
#   hash[value1] = values
# end
# p hash #== { 1 => [3, 6], 3 => [6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 4) do |value1, *values|
#   hash[value1] = values
# end
# p hash #== { 1 => [3, 6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 5) do |value1, *values|
#   hash[value1] = values
# end
# p hash #== {}
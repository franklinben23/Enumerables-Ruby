module Enumerable
  def my_each
    h_array = to_a
    0.upto(length - 1) do |v|
      yield(h_array[v])
    end
  end

  def my_each_with_index
    h_array = to_a
    0.upto(length - 1) do |v|
      yield(h_array[v], v)
    end
  end

  def my_select
    #iterate trough every instance of the array, check for the ones that make the condition true and return them into a new array.
    h_array = to_a
    new_arr = []
    var_1 = 0
    h_array.my_each do |v|
      if yield v
        new_arr[var_1] = v
        var_1 = var_1 + 1 
      end
    end
  end
  new_arr
end

# puts 'my_each for hash' + '----------------------------------'
# { fish: 'shark', bird: 'rooster'}.my_each { |v| puts "this is sequence#{v}" }

# puts 'my_each' + '----------------------------------'
# [2, 3, 7, 8, 9, 132].my_each { |v| puts "this is sequence#{v}" }

# puts 'my_each_with_index for hash' + '----------------------------------'

# { fish: 'shark', bird: 'rooster' }.my_each_with_index { |v, i| puts "this is sequence#{v} and it's index is #{i}" }

puts 'my_select' + '--------------------------------'
c = [2, 50, 3, 7, 8, 9, 132, 20, 40, 33, 5]
puts "select method : #{c.my_select {|num| num.even? }}\n\n"

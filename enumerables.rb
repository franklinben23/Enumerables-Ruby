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
    h_array = to_a
    new_arr = []
    var = 0
    h_array.my_each do |v|
      if yield v
        new_arr[var] = v
        var += 1
      end
    end
    new_arr
  end

  def my_all?
    h_array = to_a
    h_array.my_each do |v|
      return false unless yield(v)
    end
    true
  end

  def my_any?
    h_array = to_a
    h_array.my_each do |v|
      return true unless yield(v) == false
    end
    false
  end
end

# puts 'my_each for hash' + '----------------------------------'
# { fish: 'shark', bird: 'rooster'}.my_each { |v| puts "this is sequence#{v}" }

# puts 'my_each' + '----------------------------------'
# [2, 3, 7, 8, 9, 132].my_each { |v| puts "this is sequence#{v}" }

# puts 'my_each_with_index for hash' + '----------------------------------'

# { fish: 'shark', bird: 'rooster' }.my_each_with_index { |v, i| puts "this is sequence#{v} and it's index is #{i}" }

# puts 'my_select' + '--------------------------------'
c = [21, 501, 61, 141, 81, 11, 131, 1, 41, 61, 11]
# puts "select method : #{c.my_select { |num| num > 10 }}\n\n"

puts 'my_all' + '--------------------------------'
puts "select method : #{c.my_all?(&:even?)}\n\n"

puts 'my_any?' + '--------------------------------'
puts "select method : #{c.my_any?(&:even?)}\n\n"

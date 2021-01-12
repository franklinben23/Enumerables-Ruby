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
    h_array.my_each do
      return true unless yield(v) == false
    end
    false
  end

  def my_none?
    h_array = to_a
    h_array.my_each do |v|
      return false unless yield(v) == false
    end
    true
  end

  def my_count(num = '')
    h_array = to_a
    count = 0
    h_array.my_each do
      count += 1
    end
    return count unless (num == '') == false || block_given?

    num.to_i
    count = 0
    h_array.my_each do |v|
      count += 1 unless (v == num) == false
    end
    return count unless block_given?

    count = 0
    h_array.my_each do |v|
      count += 1 unless yield(v) == false
    end
    count
  end

  def my_map
    h_array = to_a
    map_arr = []
    return h_array unless block_given?
    h_array.my_each do |v|
      map_arr.push(yield(v))
    end
    map_arr
  end
end

# puts 'my_each for hash' + '----------------------------------'
# { fish: 'shark', bird: 'rooster'}.my_each { |v| puts "this is sequence#{v}" }

# puts 'my_each' + '----------------------------------'
# [2, 3, 7, 8, 9, 132].my_each { |v| puts "this is sequence#{v}" }

# puts 'my_each_with_index for hash' + '----------------------------------'

# { fish: 'shark', bird: 'rooster' }.my_each_with_index { |v, i| puts "this is sequence#{v} and it's index is #{i}" }

# puts 'my_select' + '--------------------------------'
# c = [21, 506, 61, 142, 81, 11, 133, 4, 41, 61, 11]
# puts "select method : #{c.my_select { |num| num > 10 }}\n\n"

# puts 'my_all' + '--------------------------------'
# puts "select method : #{c.my_all?(&:even?)}\n\n"

# puts 'my_any?' + '--------------------------------'
# puts "select method : #{c.my_any?(&:even?)}\n\n"

# puts 'my_none?' + '--------------------------------'
# puts "select method : #{c.my_none?(&:even?)}\n\n"

# puts 'my_count' + '--------------------------------'
# puts "count a : #{c.my_count}\n\n"
# puts "count b : #{c.my_count(11)}\n\n"
# puts "count c : #{c.my_count { |x| (x % 2).zero? }}\n\n"
# ary = [1, 2, 4, 2]
# ary.count                  #=> 4
# ary.count(2)               #=> 2
# ary.count { |x| x%2 == 0 } #=> 3

# puts 'my_map' + '--------------------------------'
# puts "select method : #{c.my_map { |num| num * 10 }}\n\n"

# puts 'my_map for hash' + '--------------------------------'
# puts "select method : #{c.map {|x| x.odd? }}\n\n"

# hash_map = { fish: 'shark', bird: 'rooster' }.my_map {|v| }
# print hash_map

hash = { key1: 'value1', key2: 'value2' }.my_map
print hash

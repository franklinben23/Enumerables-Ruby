# rubocop:disable Metrics/ModuleLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    index = 0
    h_array = to_a

    if instance_of?(Range) == true
      step do
        yield(h_array[index])
        index += 1
      end
    end
    return self unless instance_of?(Range) == false

    0.upto(length - 1) do |v|
      yield(h_array[v])
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    h_array = to_a
    0.upto(length - 1) do |v|
      yield(h_array[v], v)
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

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

  def my_all?(num = nil)
    h_array = to_a

    h_array.my_each do |v|
      break unless num.nil? == false
      return false unless (v == num) == true
    end
    return true unless block_given?

    unless block_given?
      h_array.my_each do |v|
        return false unless v == true
      end
    end
    return true unless block_given?

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

  def my_none?(num = nil)
    h_array = to_a

    h_array.my_each do |v|
      break unless num.nil? == false
      return false unless (v == num) == false
    end
    return true unless block_given?

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
    return to_enum(:double) unless block_given?

    h_array = to_a
    map_arr = []

    h_array.my_each do |v|
      map_arr.push(yield(v))
    end
    map_arr
  end

  def my_inject(num = 0, &block)
    return 'no block given (LocalJumpError)' unless block_given? || num != 0

    sum = 0
    h_range = to_a
    h_range.my_each do |v|
      sum += v
    end
    return sum unless (num == :+) == false

    sum = 1
    h_range.my_each do |v|
      sum *= v
    end
    return sum unless (num == :*) == false

    sum = 0
    h_range.my_each do |v|
      sum += v
    end
    return sum unless !num.zero? || block_given?

    sum = num
    h_range.my_each do |v|
      sum += v
    end
    return sum unless block_given?

    sum = num
    sum = h_range[0] unless num.positive?
    index = 0
    h_range.my_each do
      sum = block.yield(sum, h_range[index]) unless num.positive?
      sum = block.yield(sum, h_range[index - 1]) unless num.positive? == false
      index += 1
      break unless (index == h_range.length) == false
    end
    return sum unless num.positive?

    sum
  end
end

def multiply_els(array)
  array.my_inject(:*)
end
answer = multiply_els([2, 4, 5])
puts answer
# c = [21, 506, 61, 142, 81, 11, 133, 4, 41, 61, 11]
# proc = proc { |num, number| puts "Thank you #{num + number}" }
# arr2 = c.map(&proc) {|num| puts "changed #{num}"}
# puts arr2

# puts 'my_each for hash' + '----------------------------------'
# { fish: 'shark', bird: 'rooster'}.my_each { |v| puts "this is sequence#{v}" }

# puts 'my_each' + '----------------------------------'
# puts [21, 506, 61, 142, 81, 11, 133, 4, 41, 61, 11].my_each { |v| puts "this is sequence#{v}" }.to_s

# puts 'my_each_with_index for hash' + '----------------------------------'

# { fish: 'shark', bird: 'rooster' }.my_each_with_index { |v, i| puts "this is sequence#{v} and it's index is #{i}" }

# puts 'my_select' + '--------------------------------'
# c = [21, 506, 61, 142, 81, 11, 133, 4, 41, 61, 11]
# puts "select method : #{c.my_select { |num| num > 10 }}\n\n"

# puts 'my_all?' + '--------------------------------'
# puts "my all? method : #{ [5,5,[5]].my_all?(5) }\n\n"
# puts "all? method : #{ [5,5,[5]].all?(5) }\n\n"

# puts 'my_any?' + '--------------------------------'
# puts "select method : #{c.my_any?(&:even?)}\n\n"

# puts 'my_none?' + '--------------------------------'
# puts "my_none? method : #{['dog','car'].my_none?('dog')}\n\n"
# puts "none? method : #{['dog','car'].none?('dog')}\n\n"

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

# hash = { key1: 'value1', key2: 'value2' }.my_map
# print hash
# d = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
# e = (1..10)
# f = (1..10)

# puts 'my_inject' + '--------------------------------'
# puts "inject a : #{c.my_inject}\n\n"
# puts "inject b : #{c.my_inject(1)}\n\n"
# # puts "inject b : #{h.my_inject(11)}\n\n"
# puts "inject c : #{d.my_inject { |sum, number| sum + number }}\n\n"
# puts "inject c2 : #{d.my_inject(2) { |sum, number| sum + number }}\n\n"
# puts "inject d : #{d.my_inject(2) { |sum, number| sum * number }}\n\n"
# puts "inject e : #{e.my_inject}\n\n"
# puts "inject f : #{e.my_inject { |sum, number| sum * number }}\n\n"
# puts "inject g : #{d.inject}\n\n"
# puts "inject g : #{d.my_inject(11)}\n\n"
# rubocop:enable Metrics/ModuleLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity

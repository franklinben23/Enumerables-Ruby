require_relative 'enumerables'

# def multiply_els(array)
#   array.my_inject(:*)
# end
# answer = multiply_els([2, 4, 5])
# puts answer
# c = [21, 506, 61, 142, 81, 11, 133, 4, 41, 61, 11]
# proc = proc { |num| puts "Thank you #{num}" }
# arr2 = c.my_map(&proc)
# puts arr2

# puts 'my_each for hash' + '----------------------------------'
# { fish: 'shark', bird: 'rooster'}.my_each { |v| puts "this is key-pair values #{v}" }

# puts 'my_each' + '----------------------------------'
# puts [21, 506, 61, 142, 81, 11, 133, 4, 41, 61, 11].my_each { |v| puts "this is sequence #{v * 2}" }.to_s

puts 'my_each_with_index for hash----------------------------------'

{ fish: 'shark', bird: 'rooster' }.each_with_index { |v, i| puts "this is key-pair value #{v} and it's index is #{i}" }

# puts 'my_select' + '--------------------------------'
# c = [21, 506, 61, 142, 81, 11, 133, 4, 41, 61, 11]
# puts "select method : #{c.my_select { |num| num.even? }}\n\n"

# puts 'my_all?' + '--------------------------------'
# puts "my all? method : #{ [5,5,5].my_all?(5) }\n\n"

# puts 'my_any?' + '--------------------------------'
# puts "select method : #{c.my_any? {|v| v > 1000 }}\n\n"

# puts 'my_none?' + '--------------------------------'
# puts "my_none? method : #{['doog','car'].my_none?('dog')}\n\n"

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
# puts "inject a : #{c.your_inject}\n\n"
# puts "inject b : #{c.your_inject(1)}\n\n"
# puts "inject b : #{c.your_inject(11)}\n\n"
# puts "inject c : #{d.your_inject { |sum, number| sum + number }}\n\n"
# puts "inject c2 : #{d.your_inject(2) { |sum, number| sum + number }}\n\n"
# puts "inject d : #{d.your_inject(2) { |sum, number| sum * number }}\n\n"
# puts "inject e : #{e.your_inject}\n\n"
# puts "inject f : #{e.your_inject { |sum, number| sum * number }}\n\n"
# puts "inject g : #{d.your_inject}\n\n"
# puts "inject g : #{d.your_inject(11)}\n\n"

# puts 'Numerical array'
# p(c.your_inject { |value| value * 2})

# puts 'Range'
# p((1..10).your_inject{ |num, n| num + n})

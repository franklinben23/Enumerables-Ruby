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
end

# puts 'my_each for hash' + '----------------------------------'
# { fish: 'shark', bird: 'rooster'}.my_each { |v| puts "this is sequence#{v}" }

# puts 'my_each' + '----------------------------------'
# [2, 3, 7, 8, 9, 132].my_each { |v, i| puts "this is sequence#{v}" }

puts 'my_each_with_index for hash' + '----------------------------------'
{ fish: 'shark', bird: 'rooster' }.my_each_with_index { |v, i| puts "this is key-pair#{v} and it's index is #{i}" }

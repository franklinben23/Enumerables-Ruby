module Enumerable
  def my_each
    0.upto(length - 1) do |v|
      yield(self[v]).to_h
    end
  end

#   def my_each_with_index
#     0.upto(length - 1) do |v, i|
#       yield(self[v], v)
#       puts i
#     end
#   end
end

puts 'my_each for hash' + '----------------------------------'
{ fish: 'shark', bird: 'rooster'}.my_each { |v| puts "this is sequence#{v}" }

puts 'my_each' + '----------------------------------'
[2, 3, 7, 8, 9, 132].my_each { |v, i| puts "this is sequence#{v}" }

# puts 'my_each_with_index for hash' + '----------------------------------'
# { fish: 'shark', bird: 'rooster'}.my_each_with_index { |v, i| puts "this is key-pair#{v} and it's index is #{i}" }
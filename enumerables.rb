module Enumerable
  # def my_each
  #   0.upto(length - 1) do |v|
  #     yield(self[v])
  #   end
  # end

  
end

puts 'my_each' + '----------------------------------'
[2, 3, 7, 8, 9, 132].my_each { |v| puts "this is sequence#{v}" }

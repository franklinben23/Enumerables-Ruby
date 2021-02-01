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
    h_array
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
    h_array.my_each do |v|
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
    return to_enum(:my_map) unless block_given?

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
    return sum unless sum.positive?

    sum
  end

  def your_inject(*arg)
    raise LocalJumpError unless block_given? || !arg.empty?

    arg = arg.pop unless block_given?
    my_array = arg + to_a
    memo = my_array.shift
    if block_given?
      my_array.my_each { |item| memo = yield(memo, item) }
    else
      my_array.my_each { |item| memo = memo.send(arg, item) }
    end
    memo
  end
end

# rubocop:enable Metrics/ModuleLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity

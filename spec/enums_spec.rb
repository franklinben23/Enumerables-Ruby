require './lib/enumerables.rb'

describe Enumerable do
  describe '.my_each' do
    context 'we pass a block of code to the my_each function'
    it 'applies a block of code to each of the array elements' do
      c = [21, 506, 61, 142, 81, 11, 133, 4, 41, 61, 11]
      expect(c.my_each { |num| num * 2}).to eql(c.each { |num| num * 2})
    end

    context 'A block will not be passed'
    it 'will return to enum, expect it not no be equal because they are NOT suppossed to return the same object' do
      c = [21, 506, 61, 142, 81, 11, 133, 4, 41, 61, 11]
      expect(c.my_each).not_to eql(c.each)
    end
  end

  describe '.my_each_with_index' do
    context 'we pass a block of code to the my_each_with_index function'
    it 'applies a block of code to each of the array elements and returns the index' do
      a = [11, 22, 31, 224, 44]
      expect(a.my_each_with_index { |val,index| puts "index: #{index} for #{val}"}).to equal(a.each_with_index { |val,index| puts "index: #{index} for #{val}"})
    end

    context 'A block will not be passed'
    it 'will return to enum, expect it not no be equal because they are NOT suppossed to return the same object' do
      c = [21, 506, 61, 142, 81, 11, 133, 4, 41, 61, 11]
      expect(c.my_each_with_index).not_to eql(c.each_with_index)
    end
  end

  describe '.my_select' do
    context 'when called from an array'
    it 'will return a new array containing all the elements that return true' do
      c = [21, 506, 61, 142, 81, 11, 133, 4, 41, 61, 11]
      expect(c.my_select{ |num| puts num.even? }).to eql(c.select{ |num| puts num.even? })
    end

    context 'when called from a range'
    it 'will return a new array containing all the elements that return true' do
      expect((1..10).my_select { |val| val > 4}).to eql((1..10).select { |val| val > 4})
    end
  end

  describe '.my_all?' do
    context 'in all elements the argument is valid'
    it 'will return true if the block never returns false or nil.' do
      expect([5,5,5].my_all?(5)).to eql([5,5,5].all?(5))
    end

    context 'the argument is invalid on at least one element, should NOT return equal'
    it 'will return true if the block never returns false or nil.' do
      expect([5,5,5].my_all?(5)).not_to eql([5,5,[5]].all?(5))
    end
  end

  describe '.my_any?' do
    context 'on at least one element the argument is valid'
    it 'will returns a true value if any of the object in the enumerable satisfies the given condition, else it returns false.' do
      expect([1,5,8].my_any? {|v| v = 5 }).to eql([1,5,8].any? {|v| v = 5 })
    end

    context 'the argument is invalid on all the elements, should NOT return equal'
    it 'will returns a true value if any of the object in the enumerable satisfies the given condition, else it returns false.' do
      t = %w[ant bear cat dog penguin]
      expect(t.my_any? { |word| word.length >= 4 }).not_to eql(t.any? { |word| word.length >= 8 })
    end
  end

  describe '.my_none?' do
    context 'the argument is invalid on all the elements, should return equal'
    it 'will return a value true if none of the objects in the enumerable satisfies the given condition, else it returns false.' do
      t = %w[ant bear cat dog penguin]
      expect(t.my_none? { |word| word.length == 5 }).to eql(t.none? { |word| word.length == 5 })
    end

    context 'the argument is invalid on all the elements but one, should NOT return equal'
    it 'will return a value true if none of the objects in the enumerable satisfies the given condition, else it returns false.' do
      t = %w[ant bear cat dog penguin]
      expect(t.my_none? { |word| word.length == 5 }).not_to eql(t.none? { |word| word.length == 4 })
    end
  end
end

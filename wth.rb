module Enumerable
def my_inject(memo = nil, sym = nil, &block)
  memo = memo.to_sym if memo.is_a?(String) && !sym && !block
  block, memo = memo.to_proc, nil if memo.is_a?(Symbol) && !sym
  sym = sym.to_sym if sym.is_a?(String)
  block = sym.to_proc if sym.is_a?(Symbol)
  # Ready to rock & roll
  each do |x|
    memo = memo.nil? ? x : block.yield(memo, x) 
  end
  memo
end
end

# A variety of test cases    
p (1..4).my_inject(:*)                                # 4 factorial via Symbol =>  24
p (1..5).my_inject('*')                               # 5 factorial via String =>  120
p (1..6).my_inject { |memo, x| memo * x }             # 6 factorial via block => 720
p (1..5).my_inject(2, &:*)                            # 5 factorial doubled via Proc => 240
p (1..5).my_inject(3, :*)                             # 5 factorial tripled via Symbol =>  360
p (1..5).my_inject(4, '*')                            # 5 factorial quadrupled via String =>  480
p %w(3 4 5).my_inject(&:+)                            # string concatenation via Proc => "345"
p %w(3 4 5).my_inject("hello", &:+)                   # prefix and Proc => "hello345"
p %w(3 4 5).my_inject("howdy") { |memo, x| memo + x } # prefix and block => "howdy345"
p %w(3 4 5).my_inject("yowza", :+)                    # prefix and Symbol => "yowza345"
p %w(3 4 5).my_inject("yoiks", '+')                   # prefix and String => "yoiks345"
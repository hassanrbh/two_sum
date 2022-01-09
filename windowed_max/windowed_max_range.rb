def windowed_max_range(array,window_i)
    current_max_range = nil
    (0..array.length - window_i).each do |w|
        slice_up = array.slice(w, window_i) 
        minmax = slice_up.max - slice_up.min
        current_max_range = minmax if current_max_range.nil? || minmax > current_max_range
    end
    current_max_range
end
# Time Complexity => O(n^2)
# Space Complexity => O(n)

# Goal => Calculate [min,max] instantaneously in (Constant time)
# Solution => writing a custom data structure dedicate to solve The problem
# Optimized Solution => our custome data structure will keep track of the min and max

class MyQueue
    @stack = []
    def initialize
    end
    def peek?
        # peek at the top of the array
        @stack.last
    end
    def size?
        # returns the size of the array 
        @stack.length
    end
    def empty
        # check if the array is empty?
        @stack.empty?
    end
    def enqueue?(ele)
        # enqueue an element to the end of the array
        @stack.push(ele)
    end
    def dequeue?
        # dequeue an element at the first of the array
        @stack.shift
    end
end

class MyStack # push and pop takes O(1)
    def initialize
        @stack = []
    end
    def peek?
        # peek at the top of the array
        @stack.last
    end
    def size?
        # returns the size of the Array
        @stack.length
    end
    def empty
        # check if the array is empty
        @stack.empty?
    end
    def pop?
        @stack.pop
    end
    def push?(item)
        @stack.push(item)
    end
end

class StackQueue
    def initialize
        @stock = MyStack.new
    end
    def size
        @stock.size 
    end
    def empty?
        @stock.empty?
    end
    def enqueue?(item)
        new_queue = Mystack.new
        new_queue.push(@stock.pop) until @store.empty?
        @store.push(item)
        @store.push(new_queue.pop) until new_queue.empty?
    end
    def dequeue
        @stock.pop
    end
end

class MinMaxStack
    def initialize
        @stack = MyStack.new
    end
    def peek
        @store.last
    end
    def size
        @stack.size
    end
    def empty?
        @stock.empty?
    end
    def max
        @stack.max
    end
    def min
        @stack.max
    end
    def pop
        @stack.pop
    end
    def push(item)
        @stack.push(item)
    end
end

class MinMaxStackQueue
    def initialize
        @stack = MinStackQueue.new
    end 
    def size
        @stack.size
    end
    def empty?
        @stack.empty?
    end
    def min
        @stack.min
    end
    def max
        @stack.max
    end
    def push(item)
        new_queue = Mystack.new
        new_queue.push(@stack.pop) until @stack.empty?
        @stack.push(item)
        @stack.push(new_queue.pop) until new_queue.empty?
    end
    def pop
        @stack.pop
    end
end

def window_max_range_developed(arr,window)
    current_max_range = nil
    queue = MinMaxStackQueue.new
    (0..arr.length - window).each do |window_size|
        slicing_window = queue.enqueue(window_size)
        min_max = queue.max - queue.min
        current_max_range = min_max if current_max_range.nil? || min_max > current_max_range
    end
    current_max_range
end

require 'benchmark'

# This benchmark will calculate the time and efficiency of an algorithm ( example => is giving a performance improvement)

# Measure the performance of an variable with the growth of a variable
puts benchmark.measure { "A" * 1_000_000_000 }

# Measure the performance of a lot of variable in a loop with rapport and bm
n = 5000000
Benchmark.bm do |x|
    x.report("for => ") { for i in 1..n; a = "1"; end }
    x.report("times => ") { n.times do   ; a = "1"; end }
    x.report("upto => ") { 1.upto(n) do ; a = "1"; end }
end
def call_me_n(array, num_1, num_2)
    split_us = Array.new(0)
    (0..array.length).each_with_index do |num,idx|
        next if num_1 == idx
        length_of_the_two = num_1 + num_2
        split_us << [num] 
    end
    split_us
end
# time complexity => O(16+n+3+30+19)
# space complexity =>
# Measure bmbm for accurate performance a nd 
array = (1..1000000).map { rand }
array_test = (1..100000000).map { rand }
num_1 = 7
num_2 = 10
Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
    x.report("sort") { array.dup.sort }
    x.report("sort!") { array_test.dup.sort!} 
    x.report("sort_by") { array.dup.sort_by {|a| a}}
    x.report("call_me") { call_me(num_1,num_2)}
    x.report("call_me_n") { call_me_n(array,num_1,num_2)}
end

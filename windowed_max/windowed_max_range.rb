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
    def initialize
        @stack = []
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
        @in__stack = MyStack.new
        @out__stack = MyStack.new
    end
    def size?
        @in__stack.size + @out__stack.size
    end
    def empty
        @in__stack.empty? && @out__stack.empty?
    end
    def enqueue?(item)
        @in__stack.push(item)
    end
    def dequeue?

    end

    private 
    def queuefy
        @out_stack
    end
end

class MinMaxStack

end

class MinMaxStackQueue

end


windowed_max_range([1, 0, 2, 5, 4, 8], 2) 
windowed_max_range([1, 0, 2, 5, 4, 8], 3) 
windowed_max_range([1, 0, 2, 5, 4, 8], 4)
windowed_max_range([1, 3, 2, 5, 4, 8], 5)
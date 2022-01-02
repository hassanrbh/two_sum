# Exuction time Differences / Algorithms

# TODO : Given a list of integers find the smallest num in the list

find_smallest_ = [0, 3 , 5 , 4 , -5 , 10 , 1 , 90]

def phase_1(arr) # O(n^2) because it use nested loops for comparisons
   # Phase 1 
   arr.each_with_index do |list1,i1|
    # Global variable in the outer loop
    minimum = true 
    arr.each_with_index do |list2,i2|
        next if i1 == i2 # compare indexes of i1 and i2
        minimum = false if list2 < list1
    end
    return list1 if minimum
end
# Time complexity => O(n),
# space complexity => O(1)
def phase_2(arr)
    # create a variable that track the minimum
    minimun = arr.first # the minimun == 0  #create a minimun variable
    arr.each do |next_minimun|
        if next_minimun < minimun
            minimun = next_minimun 
        end
    end
    return minimun
end

# TODO : Largest Contiguous Sub-sum

list = [5, 3, -7] # (5) et (3) et (-7) et (5,3) et (3,-7) et (5,3,-7)
# Time complexity => O(n^3)
# Space complexity => O(n^3)
def phase_1_largest_contiguous_sub_sum(list) # 
    subs = Array.new(0)
    (0..list.length - 1).each do |start| # start with starting point
        (start..list.length - 1).each do |grps| # 
            subs << list[start..grps]
        end
    end
    
    subs.max { |sub| sub.inject(:+) }.max
end
# Time complexity => O(n)
# Space complexitt => O(1)
def phase_2_largest_contiguous_subsum(list) 
    # keep a running tally of the largest sum
    track_largest_sum = list.first
    track_current_sum = list.first
    (0..list.length-1).each do |start|
        track_current_sum = 0 if track_current_sum < 0
        track_current_sum = list[start]
        track_largest_sum = track_current_sum if track_current_sum > track_largest_sum
    end
    track_largest_sum
end
# TODO => Given an array of uniq integers and a target sum , determine whether any two integers in the array sum to that amout
# ? Examples => arr [0,1,5,7]
# ! two_sum?(arr, 6) => should be true
# ! two_sum?(arr, 10) => should be false
def bad_two_sum?(arr,target_sum)
    # if we bruteforce all the pairs in the arr and sum them until we find a pair that match the target_sum
    all_pairs = Array.new(0)
    (0..(arr.size-1)).inject([]) do |res,ele|
        res += ((ele+1)..arr.size-1).map do |n|
            all_pairs << [arr[ele],arr[n]]
        end
    end
    all_pairs.map {|pair| return "combination pair => #{pair} target_sum => #{target_sum}" if pair.sum == target_sum}
end
# * Comments => I know it bad implementation but it get the job done, the time complexity of it is O(n^3) and the space compelxity is O(n^3)
def ok_two_sum?(arr,target_sum)
    for i in 1...(arr.size-1) # set i = 1 and loop until i == size of the array
        j = i # set j = i # j = 1
        while j > 0 # check if j > 0
            if arr[j-1] > arr[j] # t

end
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
 # ! First Think I ask My self : is what I am trying to accomplish
def ok_two_sum?(arr,target_sum)
    for i in 1...(arr.size-1) # set i = 1 and loop until i == size of the array
        j = i # set j = i # j = 1
        while j > 0 # check if j > 0
            if arr[j-1] > arr[j] # we know that the j = 1, then if arr[j-1]=0 > arr[j]= 1 / 1 > 0, will be checking every number with his next num
                temp = arr[j] # create a temp variable that save the arr[j]
                arr[j],arr[j-1] = arr[j-1],temp
            else
                break;
            end 
        end
        j = j - 1 # then decrement j in every iteration
    end

    ii, jj = 0, arr.length - 1

    while ii < jj
        case (arr[ii] + arr[jj]) <=> target_sum
        when 0 # if (arr[ii] + arr[jj]) == target_sum
            return true 
        when -1
            i += 1 # when (arr[ii] + arr[jj]) < target_sum
        when 1
            j -= 1 # when (arr[ii] + arr[jj]) > target_sum
        end
    end
    false
end
# Hash Map (big gun)
# O(1) => set
# O(1) => get
def big_gun(arr,target_num)
    hash = {}

    arr.each do |el|
        return true unless hash[target_num - el].nil?
        hash[el] = target_num - el

        puts hash
        puts el
    end
     
    false
end
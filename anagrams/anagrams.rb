# TODO => The Goal of today is to write an anagram solver and look for the O(time) and O(space)
# ? anagrams is means that the letters in one word can be rearranged to another word 
# * Examples => anagrams?(gizmo) = sally => anagrams?(elvis) = lives

# ! Time Complexity => O(n!)
# ! Space Complexity => O(n!)
def first_anagrams?(word,anagram) 
    all_possible_anagrams?(word).include?(anagram)
end
def all_anagram(string_in_the_list,target)
  (0..string_in_the_list-target).each_with_index do |i|

  end
end
def all_possible_anagrams?(word)
    # The base case when the length of the word is 1 or 0 return what left of the word
    return [word] if word.length <= 1 
    # recursivly we loop through all of our possible words [0...-1]
    prev_anagrams = all_possible_anagrams?(word[0...-1])
    new_anagrams = Array.new(0)
    (prev_anagrams).each do |anagram|
        (0..anagram.length).each do |i|
            new_anagrams << anagram.dup.insert(i,word[-1])
        end
    end
    new_anagrams
end

# ! Time Complexity => O(n^2)
# ! Space Complexity => O(n)
def second_anagram(word,anagram)
    arr_word, arr_anagram = word.split(""), anagram.split("")
    arr_word.each do |element|
        target = arr_anagram.index(element) 
        return false unless target
        arr_anagram.delete_at(target)
    end
    arr_anagram.empty?
end

# ! Time Complexity => O(n*log(n))
# ! Space Complexity => O(n)
def third_anagram(word,anagram)
    word_arr , anagram_arr = word.split(""), anagram.split("")
    word_arr.sort() == anagram_arr.sort()
end

# ! Time Complexity => O()
# ! Space Complexity => O()
def fourth_anagram(word,anagram)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)
    (word.split("")).each_with_index do |element1,idx1|
        (anagram.split("")).each_with_index do |element2,idx2|
            hash_1[element2] = idx2
            hash_2[element1] = idx1
        end
    end
    hash_1
end

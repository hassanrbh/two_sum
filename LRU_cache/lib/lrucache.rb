## TODO : Implement a LRU Cashe with arrays without a linked list or a hashmap
class LRUCache
    attr_reader :cashe
    def initialize(capacity)
        @capacity = capacity
        @cashe = []
    end
    def add(val)
        if cashe.size < @capacity
            cashe.push(val)
        else
            cashe.shift
            cashe.append(val)
        end
    end
    def count
        # count the number of cashes in the array
        @cashe.size
    end
    def show
        # show all the values in the cashe
        @cashe
    end
end
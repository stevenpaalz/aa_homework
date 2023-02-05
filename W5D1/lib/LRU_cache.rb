  class LRU_Cache
    def initialize(size)
        @size = size
        @cache = []
    end

    def count
        @cache.length
    end

    def add(el)
        @cache.push(el)
        if count > @size
            @cache.shift
        end
        el
    end

    def show
        @cache
    end

    private
    # helper methods go here!

  end

#   Time complexity of #add is O(n) because of .shift. By uding a linked list and a hash map we could make this O(1). The linked list would allow us to add and remove items from the array without having to iterate through the entire cache.
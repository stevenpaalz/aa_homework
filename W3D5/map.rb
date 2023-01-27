class Map

    def initialize
        @map = []
    end

    def set(key, value)
        pos = self.key_index(key)
        if pos
            @map[pos][1] = value
        else
            @map << [key, value]
        end
    end

    def key_index(key)
        @map.each_with_index do |pair, i|
            return i if pair[0] == key
        end
        nil
    end


    def get(key)
        pos = self.key_index(key)
        @map[pos][1]
    end

    def delete(key)
        pos = self.key_index(key)
        @map = @map[0...pos] + @map[pos+1..-1]
    end

    def show
        @map
    end
end
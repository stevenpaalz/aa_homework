require "rspec"
require "LRU_cache"

describe LRU_Cache do
    subject(:cache) {LRU_Cache.new(5)}

    describe '#initialize' do
        it "should accept a size of the cache" do 
            expect{ LRU_Cache.new(3) }.to_not raise_error
        end
    end

    describe '#add' do
        it "should accept a argument and return itself" do
            expect(cache.add("abc")).to eq("abc")
        end

        it "should alter the cache" do
            cache1 = cache.dup
            cache.add(1)
            expect(cache1).to_not eq(cache)
        end

        it "should not increase in size beyond the specified length" do
            cache.add(1)
            cache.add(2)
            cache.add(3)
            cache.add(4)
            cache.add(5)
            cache.add(6)
            expect(cache.count).to eq(5)
        end

        it "should remove the least recently added element when its size is at max" do
            cache.add(1)
            cache.add(2)
            cache.add(3)
            cache.add(4)
            cache.add(5)
            cache.add(6)
            expect(cache.show).to eq([2,3,4,5,6])
        end
    end

    describe '#show' do
        it "returns the current cache" do
            cache.add(1)
            cache.add(2)
            cache.add(3)
            expect(cache.show).to eq([1, 2, 3])
        end
    end
        

end
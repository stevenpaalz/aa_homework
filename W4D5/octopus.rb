fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_oct(array)
    sorted = false
    while !sorted
        sorted = true
        (0...array.length - 1).each do |i|
            if array[i].length > array[i + 1].length
                array[i], array[i + 1] = array[i + 1], array[i]
                sorted = false
            end
        end
    end
    array[-1]
end

def dominant_oct_sort(array)
    return array if array.length < 2
    pivot = array[0]
    left = []
    right = []
    (1...array.length).each do |i|
        if array[i].length > pivot.length
            right << array[i]
        else
            left << array[i]
        end
    end
    dominant_oct_sort(left) + [pivot] + dominant_oct_sort(right)
end

def dominant_oct(array)
    dominant_oct_sort(array)[-1]
end

def clever_oct(array)
    max_pos = (0...array.length).inject {|acc, ele| array[acc].length > array[ele].length ? acc : ele}
    array[max_pos]
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(target, array)
    (0...array.length).each do |i|
        return i if array[i] == target
    end
end

new_tiles_data_structure = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6, "left-up"=>7}

def fast_dance(target, hash)
    hash[target]
end
def selection_sort(items)
    0.upto(items.size - 1) do |i|
        position = i
        j = i
        while j <= items.size - 1
            if items[j] < items[position]
                position = j
            end
            j += 1
        end
        swap(items, i, position)
        puts "i -> #{i} ; position -> #{position} ; list -> #{items.inspect}"
    end
end

def swap(items, pos1, pos2)
    temp = items[pos1]
    items[pos1] = items[pos2]
    items[pos2] = temp
end

alist = [54,26,93,17,77,31,44,55,20]
selection_sort(alist)
puts alist.inspect
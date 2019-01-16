def bubble_sort(items)
    length = items.size
    0.upto(length-2) do |i|
        j = 0
        exchange =  false
        while j <= length - i - 2
            if items[j] > items[j+1]
                temp = items[j]
                items[j] = items[j+1]
                items[j+1] = temp
                exchange = true
            end
            j+=1
        end
        break if !exchange
    end
end

items = [13, 10, 16, 8]
bubble_sort(items)
puts items.inspect
alist=[20,30,40,90,50,60,70,80,100,110]
bubble_sort(alist)
puts alist.inspect
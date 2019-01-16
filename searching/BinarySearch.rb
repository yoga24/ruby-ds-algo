def binary_search(item_list, search_item)
   start_index = 0
   end_index  = item_list.length - 1
   found = false

   while start_index <= end_index && !found
    mid = (start_index + end_index) / 2
    if search_item == item_list[mid]
        found = true
    elsif search_item < item_list[mid]
        end_index = mid - 1
    else
        start_index = mid + 1
    end
   end

   found
end

items = [1, 3, 7, 9, 13, 17, 23, 25, 28]
puts binary_search(items, 12)
puts binary_search(items, 7)
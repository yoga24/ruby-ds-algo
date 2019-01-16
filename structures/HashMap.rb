class Entry
    attr_accessor :key, :value, :collision

    def initialize(key, value)
        @key = key
        @value = value
        @collision = false
    end
end

class HashMap
    attr_reader :bucket_size, :bucket

    def initialize()
        @bucket_size = 11
        @bucket = Array.new(@bucket_size)
    end

    def get_hash(key)
        hash = key % @bucket_size
    end

    def put(key, value)
        entry = Entry.new(key, value)
        hash_key = get_hash(key)
        inserted = false

        if @bucket[hash_key].nil?
            @bucket[hash_key] = entry
        elsif @bucket[hash_key].key == key
            @bucket[hash_key].value = value
        else
            @bucket[hash_key].collision = true
            inserted = false
            until inserted
                hash_key = rehash(hash_key)
                if @bucket[hash_key].nil?
                    @bucket[hash_key] = entry
                    inserted = true
                end
            end
        end

    end

    def get(key)
        hash_key = get_hash(key)
        entry = @bucket[hash_key]
        stop = false
        start_index = hash_key


        if entry.nil?
            value = nil
        elsif entry.key == key
            value = entry.value
        elsif !entry.collision
            value = nil
        else
            until stop
                hash_key = rehash(hash_key)
                if entry.key == key
                    value = entry.value
                    stop = true
                else
                    stop = start_index == hash_key
                end
            end
        end 

        # if !entry.nil?
        #     if entry.key  == key
        #         value = entry.value
        #     elsif entry.key != key && entry.collision
        #         old_hash_key = hash_key
        #         hash_key = (hash_key + 1) % @bucket_size
        #         found = false
        #         until found || hash_key == old_hash_key
        #             if (!@bucket[hash_key].nil?) && @bucket[hash_key].key == key
        #                 found = true
        #                 value = @bucket[hash_key].value
        #             end
        #             hash_key = rehash(hash_key)
        #         end
        #     end
        # end
        value
    end

    def rehash(hash_key)
        hash_key = (hash_key + 1) % @bucket_size
    end

    def get_keys
        keys = []
        for entry in @bucket
            if !entry.nil?
                keys << entry.key
            end
        end
        keys
    end

    def get_values
        values = []
        for entry in @bucket
            if !entry.nil?
                values << entry.value
            end
        end
        values
    end

end


map = HashMap.new
#113 , 117 , 97 , 100 , 114 , 108 , 116 , 105 , 99
map.put(113,113)
map.put(117,117)
map.put(97,97)
map.put(100,100)
map.put(114,114)
map.put(108,108)
map.put(116,116)
map.put(105,105)
map.put(99,99)

puts map.get(113)
puts map.get(110)

puts map.get_keys

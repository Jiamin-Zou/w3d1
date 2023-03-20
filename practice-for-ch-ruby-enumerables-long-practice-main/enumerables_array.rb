class Array
    def my_each(&blk)
        i = 0
        while i < self.length
            blk[self[i]]
            i += 1
        end

        self
    end

    def my_select(&blk)
        new_arr = []
        my_each { |i| new_arr << i if blk.call(i) }
        return new_arr
    end

    def my_reject(&blk)
        new_arr = []
        my_each { |i| new_arr << i if !blk.call(i) }
        return new_arr
    end

    def my_any?(&blk)
        my_each { |i| return true if blk.call(i) }
        return false
    end

    def my_all?(&blk)
        my_each { |i| return false if !blk.call(i) }
        return true
    end

    def my_flatten(arr)
        return [arr] if !arr.is_a?(Array)
        new_arr = []
        arr.each do |ele|
            new_arr += my_flatten(ele)
        end
        return new_arr
    end

end
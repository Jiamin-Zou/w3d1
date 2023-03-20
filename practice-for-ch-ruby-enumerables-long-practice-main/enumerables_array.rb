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

    def my_flatten
        new_arr = []
        self.each do |ele|
            if ele.is_a?(Array)
                new_arr += ele.my_flatten
            else
                new_arr << ele
            end
        end
        return new_arr
    end

    def my_zip(*arg)
        new_arr = Array.new(self.length) {Array.new(arg.length + 1)}
        arg.unshift(self)
        new_arr = (0...self.length).map do |i|
            arg.map {|arr| arr[i]}
        end
        return new_arr
    end

    def my_rotate(n=1)
        new_arr = []
        new_arr.replace(self)
        case 
        when n > 0
            n.times do
                ele = new_arr.shift
                new_arr << ele
            end
        when n < 0
            n *= -1
            n.times do
                ele = new_arr.pop
                new_arr.unshift(ele)
            end
        end
        new_arr
    end

end
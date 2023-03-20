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
        
    end

end
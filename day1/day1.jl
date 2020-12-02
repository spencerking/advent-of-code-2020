function getinput()
    nums = readlines("input.txt")
    nums = [parse(Int, x) for x in nums]
    return nums
end

function part1()
    nums = getinput()
    len = length(nums)
    global_index = 1

    while global_index < len
        curr_num = nums[global_index]
        curr_index = global_index + 1
        
        while curr_index < len          
            if curr_num + nums[curr_index] == 2020
                return curr_num * nums[curr_index]
            end
            
            curr_index = curr_index + 1
        end
        
        global_index = global_index + 1
    end
    
    return nothing
end

function part2()
    nums = getinput()
    len = length(nums)
    global_index = 1

    while global_index < len
        curr_num = nums[global_index]
        i = global_index + 1

        while i < len
            j = i + 1
            while j < len
                if curr_num + nums[i] + nums[j] == 2020
                    return curr_num * nums[i] * nums[j]
                end
                
                j = j + 1
            end

            i = i + 1
        end
         
        global_index = global_index + 1
    end

    return nothing
end

println(part1())

println(part2())


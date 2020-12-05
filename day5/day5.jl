function getinput()
    lines = readlines("input.txt")
    passes = []

    for line in lines
        temp = ""
        temp = replace(line, "F" => "0")
        temp = replace(temp, "B" => "1")
        temp = replace(temp, "L" => "0")
        temp = replace(temp, "R" => "1")
        passes = push!(passes, parse(Int, temp, base = 2))
    end
    
    return passes
end

function part1()
    passes = getinput()
    
    return maximum(passes)
end

function part2()
    passes = sort(getinput())
    prev = passes[1]
    seat = prev
    
    for pass in passes[2:end]
        if pass != (prev + 1)
            seat = prev + 1
        end
        prev = pass
    end

    return seat
    
end

println(part1())

println(part2())

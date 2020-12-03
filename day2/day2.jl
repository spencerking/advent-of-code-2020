function getinput()
    lines = readlines("input.txt")
    input = []
    
    for line in lines
        temp = split(line)
        
        lowhigh = split(temp[1], "-")
        character = chop(temp[2])

        input = push!(input,
                      [parse(Int, lowhigh[1]),
                       parse(Int, lowhigh[2]),
                       character, temp[3]]
                      )
    end

    return input
end

function part1()
    input = getinput()
    valid = 0

    for i in input
        low = i[1]
        high = i[2]
        character = i[3][1] # Convert the one-character string to a character object
        password = i[4]

        num = count(c -> c == character, password)
        
        if (num >= low) & (num <= high)
            valid = valid + 1
        end 
    end

    return valid
end

function part2()
    input = getinput()
    valid = 0

    for i in input
        pos1 = i[1]
        pos2 = i[2]
        character = i[3][1]
        password = i[4]

        if (password[pos1] == character) ⊻ (password[pos2] == character)
            valid = valid + 1
        end
    end

    return valid
end


println(part1())

println(part2())

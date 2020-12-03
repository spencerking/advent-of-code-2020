function getinput()
    lines = readlines("input.txt")
    map = []

    for line in lines
        temp = split(line, "")
        map = push!(map, temp)
    end

    return map
end

function part1()
    map = getinput()
    linelength = length(map[1])
    totallines = length(map)
    x = 1
    y = 1
    trees = 0

    while y < totallines
        x = x + 3
        y = y + 1
        if x > linelength
            x = x - linelength
        end

        row = map[y]
        position = row[x]

        if position == "#"
            trees = trees + 1
        end
    end
    
    return trees
end

function part2()
    map = getinput()
    linelength = length(map[1])
    totallines = length(map)

    slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
    trees = 1

    for slope in slopes
        currtrees = 0
        x = 1
        y = 1
        
        while y < totallines
            x = x + slope[1]
            y = y + slope[2]
            
            if x > linelength
                x = x - linelength
            end

            row = map[y]
            position = row[x]

            if position == "#"
                currtrees = currtrees + 1
            end
        end
        trees = trees * currtrees
    end
    
    return trees
end

println(part1())

println(part2())

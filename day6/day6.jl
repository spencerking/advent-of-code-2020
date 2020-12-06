using DataStructures # provides counter function

function getinput()
    lines = readlines("input.txt")
    return lines     
end

function part1()
    lines = getinput()
    answers = ""
    qcount = 0
    
    for line in lines
        if line == ""
            qcount = qcount + length(counter(answers))
            answers = ""
        else  
            answers = answers * line
        end
    end

    qcount = qcount + length(counter(answers))

    return qcount
end

function part2()
    lines = getinput()
    answers = Dict{Char,Int}()
    qcount = 0

    counter = 0
    
    for line in lines
        if line == ""
            for (key, value) in answers
                if value == counter
                    qcount = qcount + 1
                end
            end

            counter = 0
            answers = Dict{Char,Int}()
            continue
        else
            for c in line
                if haskey(answers, c)
                    answers[c] = answers[c] + 1
                else
                    answers[c] = 1
                end
            end
        end

        counter = counter + 1
    end

    # This could be a function
    for (key, value) in answers
        if value == counter
            qcount = qcount + 1
        end
    end

    return qcount
end

println(part1())

println(part2())

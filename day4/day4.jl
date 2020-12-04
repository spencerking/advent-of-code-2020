function getinput()
    lines = readlines("input.txt")
    passports = []

    dict = Dict{String,String}()

    for line in lines
        if length(line) <= 0
            passports = push!(passports, dict)
            dict = Dict{String,String}()
            continue
        end
        
        temp = split(line)
        
        for t in temp
            field = split(t, ":")
            dict[field[1]] = field[2]
        end
    end

    passports = push!(passports, dict)
    
    return passports
end

function part1()
    passports = getinput()
    valid = 0

    for passport in passports
        if haskey(passport, "byr") &
            haskey(passport, "iyr") &
            haskey(passport, "eyr") &
            haskey(passport, "hgt") &
            haskey(passport, "hcl") &
            haskey(passport, "ecl") &
            haskey(passport, "pid")

            valid = valid + 1
        end
        
    end
    
    return valid
end

function part2()
    passports = getinput()
    valid = 0

    for passport in passports

        if haskey(passport, "byr")
            year = parse(Int, passport["byr"])
            if (year < 1920) | (year > 2002)
                continue
            end
        else
            continue
        end

        if haskey(passport, "iyr")
            year = parse(Int, passport["iyr"])
            if (year < 2010) | (year > 2020)
                continue
            end
        else
            continue
        end

        if haskey(passport, "eyr")
            year = parse(Int, passport["eyr"])
            if (year < 2020) | (year > 2030)
                continue
            end
        else
            continue
        end

        if haskey(passport, "hgt")
            str = passport["hgt"]
            unit = str[end-1:end]
            height = parse(Int, str[1:end-2])

            if unit == "cm"
                if (height < 150) | (height > 193)
                    continue
                end
            elseif unit == "in"
                if (height < 59) | (height > 76)
                    continue
                end
            else
                continue
            end
        else
            continue
        end
        
        if haskey(passport, "hcl")
            str = passport["hcl"]
            if str[1] == '#'
                color = str[2:end]
                if length(color) == 6
                    for clr in color
                        c = string(clr)
                        if (c != "a") & (c != "b") & (c != "c") & (c != "d") & (c != "e") & (c != "f") &
                            (c != "0") & (c != "1") & (c != "2") & (c != "3") & (c != "4") & (c != "5") &
                            (c != "6") & (c != "7") & (c != "8") & (c != "9")
                            continue
                        end
                    end
                else
                    continue
                end
            else
                continue
            end
        else
            continue
        end

        if haskey(passport, "ecl")
            color = passport["ecl"]
            if (color != "amb") & (color != "blu") & (color != "brn") & (color != "gry") & (color != "grn") &
                (color != "hzl") & (color != "oth")
                continue
            end
        else
            continue
        end

        if haskey(passport, "pid")
            pid = passport["pid"]
            if length(pid) != 9
                continue
            end
        else
            continue
        end

        valid = valid + 1
        
    end
    
    return valid
end

println(part1())

println(part2())

main :: IO ()
    
main = do
    -- Read input
    input <- lines <$> readFile "input.txt"

     -- Convert to Int
    let nums = map read input :: [Int]

    let p1_result = part1 nums
    print p1_result

    let p2_result = part2 nums
    print p2_result

part1 :: [Int] -> Int
part1 nums = head [a*b | a <- nums, b <- nums, a + b == 2020]

part2 :: [Int] -> Int
part2 nums = head [a*b*c | a <- nums, b <- nums, c <- nums, a + b + c == 2020]

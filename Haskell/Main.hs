-- A
sumList :: [Int] -> Int
sumList [] = -1
sumList [a] = a
sumList (x:xs) = x + (sumList xs)

-- B
maxValue :: [Int] -> Int
maxValue [] = -1
maxValue [a] = a 
maxValue [x] = maximum[x]


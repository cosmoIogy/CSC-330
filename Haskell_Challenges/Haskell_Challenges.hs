module Haskell_Challenges where
import Data.Char (ord)        -- used for Challenge 2c
import Data.List (elemIndex)  -- useful for Challenge 3a
import Data.Maybe (fromJust)  -- useful for Challenge 3a

{- LEVEL 0: intro -}
-- challenge a
sanityCheck :: Int
sanityCheck = 42

{- LEVEL 1: simple -}
-- challenge a
sign :: Int -> Int
sign x
    | x < 0 = -1
    | x == 0 = 0
    | otherwise = 1

-- challenge b


-- challenge c
addLists :: (Real a) => [a] -> [a] -> [Float]
addLists xs ys
    | length xs /= length ys = []
    | otherwise = zipWith (+) (map realToFrac xs) (map realToFrac ys)


-- challenge d
prod :: Int -> [Int] -> Int
prod 0 _ = 1
prod n (x:xs) = x * prod (n-1) xs


{- LEVEL 2: hard -}
-- challenge a
addLastNItems :: [Int] -> Int -> Int
addLastNItems xs n
    | null xs = -2
    | n == 0 = 0
    | n < 0 = -1
    | n > length xs = sum xs + 1
    | otherwise = sum (drop (length xs - n) xs)

-- challenge b


-- challenge c


-- challenge d



{- LEVEL 3: nightmare fuel -}
-- challenge a
dbzPwrLvls = [["Bulma",       "5"],
              ["Krillin",  "1000"],
              ["Gohan",   "15000"],
              ["Piccolo", "25000"],
              ["Vegeta",  "75000"],
              ["Goku",   "100000"]]




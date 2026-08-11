module Main where

import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    start args

start :: [String] -> IO ()
start [] = generate 30 [1]
start xs = generate 30 (toInts xs)

generate :: Int -> [Int] -> IO ()
generate 0 _ = return ()
generate n xs = do
    putStrLn (showList20 xs ++ " : " ++ show (average xs))
    generate (n - 1) (next xs)

next :: [Int] -> [Int]
next [] = []
next (x:xs) = encode 1 x xs

encode :: Int -> Int -> [Int] -> [Int]
encode count value [] = [count, value]
encode count value (x:xs)
    | x == value = encode (count + 1) value xs
    | otherwise  = count : value : encode 1 x xs

average :: [Int] -> Float
average xs = fromIntegral (sumList xs) / fromIntegral (lengthList xs)

sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

lengthList :: [Int] -> Int
lengthList [] = 0
lengthList (_:xs) = 1 + lengthList xs

showList20 :: [Int] -> String
showList20 xs
    | lengthList xs <= 20 = show xs
    | otherwise = "[" ++ showItems (take20 xs) ++ ",...]"

take20 :: [Int] -> [Int]
take20 = takeN 20

takeN :: Int -> [Int] -> [Int]
takeN 0 _ = []
takeN _ [] = []
takeN n (x:xs) = x : takeN (n - 1) xs

showItems :: [Int] -> String
showItems [] = ""
showItems [x] = show x
showItems (x:xs) = show x ++ "," ++ showItems xs

toInts :: [String] -> [Int]
toInts [] = []
toInts (x:xs) = read x : toInts xs
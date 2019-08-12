module Rec where

myZip :: [a] -> [b] -> [(a, b)]
myZip [] _ = []
myZip _ [] = []
myZip (x:xs) (y:ys) = (x, y) : myZip xs ys

myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + length xs

-- quicksort
qSort :: Ord a => [a] -> [a]
qSort [] = []
qSort (x:xs) = qSort l ++ [x] ++ qSort r
  where
    l = [a | a <- xs, a <= x]
    r = [b | b <- xs, b > x]

-- mutual recursion
myEven :: Int -> Bool
myEven 0 = True
myEven n = myOdd (n - 1)

myOdd :: Int -> Bool
myOdd 0 = False
myOdd n = myEven (n - 1)

myDrop :: Int -> [a] -> [a]
myDrop 0 xs     = xs
myDrop _ []     = []
myDrop n (_:xs) = drop (n - 1) xs

-- 6.8
-- 1.
myFac :: Int -> Int
myFac 0 = 1
myFac n | n > 0 = n * myFac (n - 1)

-- 2.
sumdown :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown (n - 1)

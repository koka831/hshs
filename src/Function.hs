module Function (
  myEven,
  myAbs,
  mySignum
) where


myEven :: Integral a => a -> Bool
myEven n = n `mod` 2 == 0


splitAt :: Int -> [a] -> ([a], [a])
splitAt n xs = (take n xs, drop n xs)

recip :: Fractional a => a -> a
recip n = 1 / n

-- condition
myAbs :: Int -> Int
myAbs n = if n >= 0 then n else -n

mySignum :: Int -> Int
mySignum n = if n < 0 then -1 else
                if n == 0 then 0 else 1

-- guard
myAbs2 :: Int -> Int
myAbs2 n | n >= 0     = 0
         | otherwise  = -n

mySignum2 :: Int -> Int
mySignum2 n | n < 0     = -1
            | n == 0    = 0
            | otherwise = 1

-- pattern matching
myNot :: Bool -> Bool
myNot False = True
myNot _ = False -- _ as wildcard


myFst :: (a, b) -> a
myFst (x, _) = x

mySnd :: (a, b) -> b
mySnd (_, y) = y

-- lambda function
lambdaAdd :: Int -> (Int -> Int)
lambdaAdd = \x -> (\y -> x + y)

-- odds :: Int -> [Int]
-- odds n = map f [0..n-1]
--          where f x = x * 2 + 1
odds :: Int -> [Int]
odds n = map (\x -> x * 2 + 1) [0..n - 1]

-- section (for operator)
-- (#) = \x -> (\y -> x # y)
-- (x #) = \y -> x # y
-- (# y) = \x -> x # y

-- 4.8.1
halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
  where n = length xs `div` 2

-- 4.8.2
-- head|tail
third1 :: [a] -> a
third1 xs = head (tail (tail xs))
-- !! operator
third2 :: [a] -> a
third2 xs = xs !! 2
-- pattern match
third3 :: [a] -> a
third3 (_:_:x:_) = x

-- 4.8.3
-- if
safetail1 :: [a] -> [a]
safetail1 xs = if null xs then [] else tail xs
-- guard
safetail2 :: [a] -> [a]
safetail2 xs | null xs    = []
             | otherwise  = tail xs
-- pattern match
safetail3 :: [a] -> [a]
safetail3 [] = []
safetail3 (_:xs) = tail xs

-- 4.8.4
  -- True || True = True
  -- True || False = True
  -- False || True = True
  -- False || False = False

-- 4.8.5
myAnd a b = if a == False then False else
  if b == True then True else False

-- 4.8.7
-- mult :: Int -> Int -> Int -> Int
-- mult x y z = x * y * z
-- lambda
multA :: Int -> (Int -> (Int -> Int))
multA = \x -> (\y -> (\z -> x * y * z))

-- 4.8.8
-- Luhn Algorithm
luhnDouble :: Int -> Int
luhnDouble n = if x > 9 then x - 9 else x
  where x = n * 2

main = do
  print (myEven 2)
  print (myEven 3)
  print (halve [1, 2, 3, 4]) -- ([1, 2], [3, 4])
  print (third1 [1, 2, 3, 4, 5]) -- 3
  print (third2 [1, 2, 3, 4, 5]) -- 3
  print (third3 [1, 2, 3, 4, 5]) -- 3
  print (myAnd True True) -- True
  print (myAnd True False) -- False
  print (myAnd False False) -- False
  print (luhnDouble 5) -- 5 * 2 - 9
  print (luhnDouble 4) -- 4 * 2

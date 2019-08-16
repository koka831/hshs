module HigherOrderFunction where
import Data.Char

-- return function: currying
-- function in argument: higher order function
myMap :: (a -> b) -> [a] -> [b]
myMap f xs = [f x | x <- xs]
-- map f [] = []
-- map f (x:xs) = f x : map f xs

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p xs = [x | x <- xs, p x]
-- filter p [] = []
-- filter p (x:xs) | p x = x : filter p xs
--                 | otherwise = filter p xs

-- f [] = v
-- f (x:xs) = x # f xs
foldRight :: (a -> b -> b) -> b -> [a] -> b
foldRight f v [] = v
foldRight f v (x:xs) = f x (foldRight f v xs)

-- foldLeft (#) v [x0, x1, ..., xn] =
--    (... ((v # x0) # x1) ...) # xn
foldLeft :: (a -> b -> a) -> a -> [b] -> a
foldLeft f v [] = v
foldLeft f v (x:xs) = foldLeft f (f v x) xs

foldLen :: [a] -> Int
foldLen = foldRight (\_ n -> n + 1) 0

-- Composit function operator
-- (.) :: (b -> c) -> (a -> b) -> (a -> c)
-- f . g = \x -> f (g x)
id :: a -> a
id = \x -> x

-- cardinal translator
type Bit = Int
bin2int :: [Bit] -> Int
-- iterate f x = [x, f x, f (f x), f (f (f x)), ..]
-- bin2int bits = sum [w * b | (w, b) <- zip weights bits]
  -- where weights = iterate (*2) 1
bin2int = foldr (\x y -> x + 2 * y) 0

-- 7.9.
-- 1.
-- [f x | x <- xs p x] with map & filter
-- map f (filter p xs)

-- 2.
myAll :: (a -> Bool) -> [a] -> Bool
myAll p = and . map p

myAny :: (a -> Bool) -> [a] -> Bool
myAny p = or . map p

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile _ [] = []
myTakeWhile p (x:xs) | p x = x : takeWhile p xs
                     | otherwise = []


myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile _ [] = []
myDropWhile p (x:xs) | p x = dropWhile p xs
                     | otherwise = x : xs

-- 3.
-- map & filter by foldr


main = do
  print (map (^2) [1, 3, 4, 5])

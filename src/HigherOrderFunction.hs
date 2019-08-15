module HigherOrderFunction where
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
-- e.g
-- sum :: Num a => [a] -> a
-- sum = foldr (+) 0
foldRight :: (a -> b -> b) -> b -> [a] -> b
foldRight f v [] = v
foldRight f v (x:xs) = f x (foldRight f v xs)


main = do
  print (map (^2) [1, 3, 4, 5])

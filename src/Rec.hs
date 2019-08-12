module Rec where

myZip :: [a] -> [b] -> [(a, b)]
myZip [] _ = []
myZip _ [] = []
myZip (x:xs) (y:ys) = (x, y) : myZip xs ys

main = do
  print(myZip [1, 2, 3] [4, 5, 6])

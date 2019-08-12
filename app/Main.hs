module Main where

import Lib
import Rec

main :: IO ()
main = do
  someFunc
  print (myZip [1, 2, 3] [4, 5, 6])

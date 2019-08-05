-- 2.7.3
n = a `div` length xs
    where
      a = 10
      xs = [1, 2, 3, 4, 5]


-- 2.7.4
my_last xs = head (reverse xs)
my_last2 xs = xs !! (length xs - 1)

-- 2.7.5
my_init xs = reverse (tail (reverse xs))

main = do
  print n
  print (my_last [1, 2, 3, 4, 5]) -- 5
  print (my_last2 [1, 2, 3, 4, 5]) -- 5
  print (my_init [1, 2, 3, 4, 5]) -- [1, 2, 3, 4]

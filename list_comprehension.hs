import Data.Char
-- list comprehension
-- <- [range object]: generator
x = [x ^ 2 | x <- [1..5]]
-- latter generator may use former variable
xy = [(x, y) | x <- [1, 2, 3], y <- [x..5]]


myConcat :: [[a]] -> [a]
myConcat xss = [x | xs <- xss, x <- xs]

-- may discard values using wildcard
myLength :: [a] -> Int
myLength xs = sum [1 | _ <- xs] -- <- xs : is like a counter

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

isPrime :: Int -> Bool
isPrime n = factors n == [1, n]

myFind :: Eq a => a -> [(a, b)] -> [b]
myFind k ts = [v | (k', v) <- ts, k == k']

-- Caesar Cipher
let2int :: Char -> Int
let2int c = ord c - ord 'a'

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n c | isLower c = int2let ((let2int c + n) `mod` 26)
          | otherwise = c

-- encoder/decoder
-- String is a syntax sugar of [Char]
-- encode with (n, xs)/ decode with (-n, xs')
encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

-- 5.7.1
to100 = [x ^ 2 | x <- [1..100]]

-- 5.7.2
grid :: Int -> Int -> [(Int, Int)]
grid x y = [(x', y') | x' <- [0..x], y' <- [0..y]]

-- 5.7.3
square :: Int -> [(Int, Int)]
square n = [(x, y) | (x, y) <- grid n n, x /= y]

-- 5.7.4
replicate :: Int -> a -> [a]
replicate n x = [x | _ <- [1..n]]

-- 5.7.5
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x ^ 2 + y ^ 2 == z ^ 2]

-- 5.7.6
perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum (factors x) == x + x] -- since sum (factors) contains x itself

-- 5.7.9
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct as bs = sum [(as !! i) * (bs !! i) | i <- [0..length as -1]]


main = do
  print (x)
  print (xy)
  print (factors 24)
  print (isPrime 57) -- why not 57 is a prime number
  print (grid 1 2)
  print (pyths 10)
  print (perfects 500)
  print (scalarproduct [1, 2, 3] [4, 5, 6])

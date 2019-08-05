{-
  f :: A -> B , e :: A / f e :: B
-}

-- currying
mult :: Int -> (Int -> (Int -> Int))
-- left join
-- (((mult x) y) z)
mult x y z = x * y * z

-- parametric polymorphism
-- e.g.)
-- length :: [a] -> Int

-- Ad hoc polymorphism
-- e.g.)
-- (+) :: Num a => a -> a -> a

-- Num class
  -- (+) :: a -> a -> a
  -- (-) :: a -> a -> a
  -- (*) :: a -> a -> a
  -- negate :: a -> a
  -- abs :: a -> a
  -- signum :: a -> a

-- Integral :: Instance of Num class
-- Note: `Instance` of Haskell is not meant as of OOP.
  -- div :: a -> a

-- Tuple
-- e.g.)
-- ([False], 'a') :: ([Bool], Char)

-- Function type
-- e.g.)
-- not :: Bool -> Bool
-- even :: Int -> Bool

-- 3.11.2
bools :: [Bool]
bools = [True, False]

nums :: [[Int]]
nums = [[1, 2, 3], [4, 5, 6]]

add :: Int -> Int -> Int -> Int
add a b c = a + b + c 

copy :: a -> (a, a)
copy a = (a, a)

apply :: (a -> b) -> a -> b
apply fn a = fn a

-- 3.11.3
second :: [a] -> a
second xs = head (tail xs)

swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

pair :: a -> b -> (a, b)
pair x y = (x, y)

double :: Num x => x -> x
double x = x * 2

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (x -> x) -> x -> x
twice f x = f (f x)


main = do
  print (mult 1 2 3)
  print (add 1 2 3)
  print (copy 1)
  print (copy "foo")
  print (pair 1 2)
  print (double 1)
  print (palindrome [1, 2, 1])
  print (twice double 2)

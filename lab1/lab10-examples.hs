-- "Range" syntax for generating lists (.. operator):
--
-- [1..100] generates a list of the numbers from 1 to 100 inclusive.
-- ['a'..'z'] generates a list with all the lower case Latin letter.
-- [2,4..100] generates a list with all the even numbers form 2 to 100.
-- [100,99..1] generates a list with the numbers from 100 to 1.
-- [1..] generates an infinite list of all integers starting at 1.
-- take 100 [1..] selects only the first 100 elements from an infinite list.

-- Implementation of factorial using range syntax.
fact n = product [1..n]

-- Higher-order functions on lists in Haskell.

-- map :: (a -> b) -> [a] -> [b] is a built-in function.
-- Example implementation of map using pattern matching.
myMap :: (a -> b) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs

-- filter :: (a -> Bool) -> [a] -> [a] is a built-in function.
-- Example implementation of filter using pattern matching and guards.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p [] = []
myFilter p (x:xs)
  | p x = x : myFilter p xs
  | otherwise = myFilter p xs

-- foldl :: (a -> b -> a) -> a -> [b] -> a is a built in function.
-- The name stands for "fold left" which is equivalent to accumulate in Scheme.
-- Example implementation of foldl using pattern matching.
myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl f initial [] = initial
myFoldl f initial (x:xs) = myFoldl f (f initial x) xs

-- There is also a built-in function foldr that does accumulation from right
-- to left instead of from left to right (foldl):
-- foldr :: (a -> b -> b) -> b -> [a] -> b

-- Implement a function to find the product of all items in a list using foldl.
myProduct :: (Num a) => [a] -> a
myProduct items = foldl (*) 1 items

-- Creating lambda functions - use \ syntax.
-- Example implementation of the identity function using lambda.
identity :: a -> a
identity = \x -> x

-- Calling a higher-order function by passing a lambda function:
--   map (\x -> 2 * x) [1..10]

-- Implementing derivative with lambda.
derivative :: (Double -> Double) -> (Double -> Double)
derivative f =
  \x -> (f (x + 0.0001) - f x) / 0.0001


-- Example of using higher-order functions to compute the sum of all odd
-- squares in the range [a, b]. The correct way to think of the implementation
-- is as a pipeline of processing steps.
--
-- Int   _________           _______           ________           _____
-- ---> |Enumerate| [Int]   |  Map  | [Int]   | Filter | [Int]   | sum | Int
-- Int  |  a, b   | ------> |  ^2   | ------> |  odd   | ------> |     | --->
-- ---> |_________|         |_______|         |________|         |_____|
--
sumOfOddSquares :: Integer -> Integer -> Integer
sumOfOddSquares a b =
  sum (filter odd (map (^2) [a..b]))


-- Example of using higher-order functions to compute the sum of all "evenly"
-- numbers in the interval [a, b]. An "evenly" number is a number for which
-- the count of it's divisors is an even number. Again the computation can be
-- viewed as a pipeline of processing steps.
--
-- sumOfEvenly a b
--
-- Int   _________           ________           _____
-- ---> |Enumerate| [Int]   | Filter | [Int]   | sum | Int
-- Int  |  a, b   | ------> | evenly | ------> |     | --->
-- ---> |_________|         |________|         |_____|
--
--
-- evenly n
--       ________           ________          ______
-- Int  |Divisors| [Int]   | Length | Int    | even | Bool
-- ---> |   n    | ------> |        | -----> |      | ----> 
--      |________|         |________|        |______|
--
-- 
-- divisors n
--      
--       _________          ______________
-- Int  |Enumerate| [Int]  |    Filter    | [Int]
-- ---> |  1, n   | -----> | rem n x == 0 | ------> 
--      |_________|        |______________|
--

sumOfEvenly :: Integer -> Integer -> Integer
sumOfEvenly a b =
  sum (filter evenly [a..b])

evenly :: Integer -> Bool
evenly n =
  even (length (divisors n))

divisors :: Integer -> [Integer]
divisors n =
  filter (\x -> rem n x == 0) [1..n]

-- List comprehensions (special syntactic sugar for maps, filters
-- and other cool stuff). Examples:
--
-- An expression equivalent to map (2*) [1..10]
--   > [2*x | x <- [1..10]]
--   [2,4,6,8,10,12,14,16,18,20]
--
-- An expression equivalent to filter (\x -> rem x 3 == 0) [1..10]
--   > [x | x <- [1..10], rem x 3 == 0]
--   [3,6,9]
--
-- A list comprehension that computes the Cartesian product of 2 lists
--   > [[x,y] | x <- [1..10], y <- [1..10]]

-- Example implement a function that finds the length of a list using
-- list comprehensions.
myLength :: [a] -> Int
myLength items = sum [1 | x <- items]


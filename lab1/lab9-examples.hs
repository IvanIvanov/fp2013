-- Defining a name/constant.
answer = 42

-- Defining a simple one argument function.
square x = x * x

sumOfSquares a b = square a + square b

-- Implement fibanacci using an if expression.
fib1 n =
  if n <= 1
    then n
    else fib1 (n - 1) + fib1 (n - 2)

-- Implement fibonacci using pattern patching.
fib2 0 = 0
fib2 1 = 1
fib2 n = fib2 (n - 1) + fib2 (n - 2)

-- Implement fibonacci using guards.
fib3 n
  | n <= 1 = n
  | otherwise = fib3 (n - 1) + fib3 (n - 2)


-- Implement max function using guards.
myMax a b
  | a > b = a
  | otherwise = b


-- Function that computes the sum of divisors of a number.
sumOfDivisors n =
  sumOfDivisorsHelper n 1

sumOfDivisorsHelper n i
  | i > n = 0
  | rem n i == 0 = i + sumOfDivisorsHelper n (i + 1)
  | otherwise = sumOfDivisorsHelper n (i + 1)

-- Function that computes the sum of divisors of a number -
-- alternative implementation. Even though this may seem like tail
-- recursion there is no guarantee that it will actually execute like
-- one because of Haskell's lazy evaluation.
sumOfDivisors2 n =
  sumOfDivisorsHelper2 n 1 0

sumOfDivisorsHelper2 n i result
  | i > n = result
  | rem n i == 0 = sumOfDivisorsHelper2 n (i + 1) (result + i)
  | otherwise = sumOfDivisorsHelper2 n (i + 1) result


-- Function that checks if a number is prime.
isPrime n =
  sumOfDivisors n == n + 1

-- Function that computes the sum of all decimal digits of a whole number.
digitSum n
  | n < 10 = n
  | otherwise = rem n 10 + digitSum (div n 10)

-- Basic Haskell types:
--   Int     - a 32 bit integer [2^31, 2^31-1]
--   Integer - an abitrary precision integer data type
--   Bool    - a type with two values - True and False
--   Char    - a unicode character type. Examples: 'a', 'Z', etc
--   Float   - a 32 bit floating point number.
--   Double  - a 64 bit floating point number.

-- Explicitly declaring the type of a given constant. Use the :: operator.
myPi :: Double
myPi = 3.14159

-- Explicitly declaring the type of a function. For function types the arrow
-- (->) operator is used. The example below declares a function that takes a
-- single argument of type Integer and returns a value of type Integer.
cube :: Integer -> Integer
cube x = x * x * x

-- Explicitly declaring the type of a multi-argument function. Again the arrow
-- (->) operator is used in describing the type of the function. The example
-- below describes a function that takes as its first argument something of
-- type Integer, then it takes as a second argument something else of type
-- Inetger, then it takes as a third argument something else of type Integer
-- and finaly it returns something of type Integer as a result.
--
-- A deeper explanation of the example below goes like this. The arrow (->)
-- operator is right associative thus the expression:
--
--   Integer -> Integer -> Integer -> Integer
--
-- Is actually equivalent to:
--
--   (Integer -> (Integer -> (Integer -> Integer)))
--
-- Since the meaning of the arrow (->) operator is a function with an argument
-- who's type is defined by (->)'s first operand which returns a value with
-- a type equal to (->)'s second operand. We can describe the type declaration
-- in the following manner - a function that takes a single argument of type
-- Integer and returns as a result a function. The function that is returned
-- takes a single argument of type Integer and itself returns a function. This
-- function is the last one in the chain as it takes a single argument of type
-- integer and returns a result something of type integer.
--
-- The explanation describes how Haskell actually computes multi-argument
-- functions - by treating them as single argument functions. This technique
-- is called currying:
--
--   http://en.wikipedia.org/wiki/Currying
--
-- Don't worry too much about currying at this point. It just happens behind
-- the sense when Haskell computes expressions and you don't have to do
-- anything special to actually implement multi-argument functions.
--
addThree :: Integer -> Integer -> Integer -> Integer
addThree a b c =
  a + b + c

-- Types of data and functions can be checked in ghci (Haskell's REPL) by
-- using the :t or :type command:
--
--   > :type True
--   True :: Bool
--
--   > :type False
--   False :: False
--
--   > :type addThree
--   addThree :: Integer -> Integer -> Integer -> Integer
--
-- What happens when we don't explicitly specify the type of a given function
-- or constant that we declare? Let's check:
--
--   > :type sumOfDivisors
--   sumOfDivisors :: (Integeral a) => a -> a
--
-- Haskell automatically infers the type of our function! The inferred type
-- looks a bit different from the types that we declare in our own functions.
-- The reason is that the above expression uses polymorphic types. The type
-- of sumOfDivisors can be interpreted as follows. SumOfDivisors takes
-- something of type "a" and returns something of the same type as a result.
-- However "a" is not a concrete type but rather a type parameter that can
-- be substituted with any concrete type that matches the type constraint
-- specified by the expression (Integeral a). That means that the types "a"
-- that the function accepts must be an instance of the Integral typeclass.
-- What this means in non-Haskell is that type "a" needs to have some
-- predefined functions (defined in the Intgeral typeclass) that have to work
-- on "a"'s - for Integral these include functions for doing remainder and
-- division on whole numbers.
--
-- The reason that type polymorphism is useful is that it allows us to define
-- functions that operate on multiple types. For illustrative purposes suppose
-- that Haskell didn't support polymorphic types. Since it is a statically
-- typed programming language that would force each and every function to be
-- bound with concrete types at compile time and would only be able to operate
-- on those concrete types. As a consequence we would have to declare different
-- versions of sumOfDivisors for each and every concrete type with which we
-- would like to use it - one version for Int, one version for Integer, etc.
-- But since Haskell supports polymorphic types we can define a single
-- implementation that will work with all types that satisfy the type
-- constraints.
--

-- Haskell Lists:
--   [] - the empty list.
--
--   :  - the same as cons in Scheme. For example: 1:[] -> [1, 2]
--
--   [1, 2, 3, 4] - a list of 4 elements. This is the same as 1:2:3:4:[].
--                  It is also the same as '(1 2 3 4) in Scheme.
--
--   head - the same as car in Scheme. For example: head [1, 2, 3] -> 1
--
--   tail - the same as cdr in Scheme. For example: tail [1, 2, 3] -> [2, 3]
--
--   !! - the nth element of a list (the elements are 0 based). For example:
--        [1, 2, 3] !! 0 -> 1
--
--   length - finds the length of the list.
--
--   reverse - reverses the elements of a list. reverse [1, 2, 3] -> [3, 2, 1]
--
--   take - takes the first k elements of a list. For example:
--          take 2 [1, 2, 3] -> [1, 2]
--
--   drop - removes the first k elements of a list. For example:
--          drop 2 [1, 2, 3] -> [3]
--
--   maximum - finds the largest element in a list. For example:
--             maximum [1, 2, 3] -> 3
--
--   minimum - finds the smallest element in a list. For example:
--             minimum [1, 2, 3] -> 1
--
--   sum - finds the sum of all elements in a list. For example:
--         sum [1, 2, 3] -> 6
--
--   product - finds the product of all elements in a list. For example:
--             product [1, 2, 3, 4] -> 24
--
--   ++ - appends two lists. For example: [1, 2] ++ [3, 4] = [1, 2, 3, 4]

-- Example of a recursive function on lists that uses pattern matching.
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- The same function using guards. The polymorphic type "a" must be an instance
-- of the Eq typeclass since the implementation uses the == operator which is
-- defined in Eq.
myLength2 :: (Eq a) => [a] -> Int
myLength2 items
  | items == [] = 0
  | otherwise = 1 + myLength2 (tail items)



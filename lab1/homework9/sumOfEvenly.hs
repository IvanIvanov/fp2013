sumOfEvenly :: Int -> Int -> Int
sumOfEvenly a b
  | a > b = 0
  | isEvenly a = a + sumOfEvenly (a + 1) b
  | otherwise = sumOfEvenly (a + 1) b

isEvenly :: Int -> Bool
isEvenly n =
  even (numberOfDivisors n)

numberOfDivisors :: Int -> Int
numberOfDivisors n =
  numberOfDivisorsHelper n 1

numberOfDivisorsHelper :: Int -> Int -> Int
numberOfDivisorsHelper n i
  | i > n = 0
  | rem n i == 0 = 1 + numberOfDivisorsHelper n (i + 1)
  | otherwise = numberOfDivisorsHelper n (i + 1)



squarePrimes :: Integer -> [Integer]
squarePrimes n =
  map (^2) (filter isPrime [n..])
  -- или: [x^2 | x <- [n..], isPrime x]

isPrime :: Integer -> Bool
isPrime n =
  sumOfDivisors n == n + 1

sumOfDivisors :: Integer -> Integer
sumOfDivisors n =
  sum (filter (\x -> rem n x == 0) [1..n])


coolNumbers :: Int -> Int -> [Int]
coolNumbers a b =
  filter isCool [a..b]

isCool :: Int -> Bool
isCool n =
  isPrime (divisorSum n)

isPrime :: Int -> Bool
isPrime n =
  divisorSum n == n + 1

divisorSum :: Int -> Int
divisorSum n =
  sum (filter (\x -> rem n x == 0) [1..n])


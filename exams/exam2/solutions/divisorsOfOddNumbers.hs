divisorsOfOddNumbers :: Integer -> [[Integer]]
divisorsOfOddNumbers n =
  [divisors x | x <- [n..], odd x]

divisors :: Integer -> [Integer]
divisors n =
  [x | x <- [1..n], rem n x == 0]


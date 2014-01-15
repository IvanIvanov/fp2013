divisorsOfEvenNumbers :: Integer -> [[Integer]]
divisorsOfEvenNumbers n =
  [divisors x | x <- [n..], even x]

divisors :: Integer -> [Integer]
divisors n =
  [x | x <- [1..n], rem n x == 0]


fact2 :: Integer -> Integer
fact2 0 = 1
fact2 1 = 1
fact2 n = n * fact2 (n - 2)


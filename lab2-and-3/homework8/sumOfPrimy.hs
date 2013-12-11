-- връща списък с делителите на n, включително 1 и n
divisors n = [x | x <- [1..n], n `mod` x == 0]

-- връща сумата на всички делители на n, включително 1 и n
sumOfDivisors :: Integral a => a -> a
sumOfDivisors n = sum $ divisors n

-- проверява дали дадено число е просто
isPrime :: Int -> Bool
isPrime n = (n + 1) == sumOfDivisors n

-- проверява дали дадено число е "простовато"
-- ако броят на делителите му е просто число
isPrimy :: Int -> Bool
isPrimy n = isPrime $ length $ divisors n

-- решаваме задачата
-- създаваме списък с всички числа межуд а и б
-- филтрираме го с isPrimy
-- и накрая сумираме останалите числа ;)
sumOfPrimy a b = sum $ filter isPrimy [a..b]

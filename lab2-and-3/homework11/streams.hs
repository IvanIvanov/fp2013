primes :: [Int]
primes = filter isPrime [1..]
  where 
    divisors n = [x | x <- [1..n], n `mod` x == 0]
    sumOfDivisors n = sum $ divisors n
    isPrime n = (n + 1) == sumOfDivisors n
    

-- Функцията връща безкраен списък с квадратите на всички прости числа
squarePrimes :: [Int]

-- Функцията взима два безкрайни потока и връща нов,
-- В който елементът на място Ci представлява сумата на елементите Ai и Bi от първите два потока
-- Например : take 5 $ sumStreams [1..] [1..] връща [2, 4, 6, 8, 10] (1 + 1, 2 + 2, 3 + 3, 4 + 4 и т.н.)
sumStreams :: [Int] -> [Int] -> [Int]

-- Функцията взима два безкрайни потока и връща нов,
-- Който представлява алтернирането на първите два потока
-- Ако имаме [a1, a2, a3, ...] и [b1, b2, b3, ...]
-- Новият поток ще представлява [a1, b1, a2, b2, a3 ,b3 ...]
-- Например : take 10 $ alternateStreams [100..] primes дава резултат [100,2,101,3,102,5,103,7,104,11]
alternateStreams :: [Int] -> [Int] -> [Int]
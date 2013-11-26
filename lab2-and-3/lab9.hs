square :: Int -> Int
square x = x * x

-- Integer действа катo BigInt
-- Правим проверка и за отрицателно число
fact :: Integer -> Integer
fact 0 = 1
fact n
  | n < 0 = 0
  | otherwise = n * fact (n - 1)

-- fact 5 -> 120
-- fact (-2) -> 0

abs' :: Int -> Int
abs' x
  | x < 0 = (-x)
  | otherwise = x
  
-- abs' 2 -> 2
-- abs' (-2) -> 2


-- Фунцкията проверява дали триъгълник със страни a b c
-- Е Питагоров. Приемаме, че c е хипотенузата

pyth :: Int -> Int -> Int -> Bool
pyth a b c = (a^2) + (b^2) == c^2

-- Проверява дали x е в интервала [a, b]
between :: Int -> Int -> Int -> Bool
between a b x = (x >= a) && (x <= b)

-- Връща сумата на делителите на цяло число
-- Използваме помощна функция, за да реализираме опашкова рекурсия
sumOfDivisors :: Int -> Int
sumOfDivisors n = sumOfDivisors' n 1 0

sumOfDivisors' :: Int -> Int -> Int -> Int
sumOfDivisors' n start result
  | start > n = result
  | n `mod` start == 0 = sumOfDivisors' n (start + 1) (result + start)
  | otherwise = sumOfDivisors' n (start + 1) result


-- Проверява дали число е просто, като използва sumofDivisors
isPrime :: Int -> Bool
isPrime n = sumOfDivisors n == n + 1

-- Сумира всички числа в интервала [a,b]
sum' :: Int -> Int -> Int
sum' a b
  | a > b = 0
  | otherwise = a + (sum' (a + 1) b)

-- sumOfDivisors, имплементирано чрез range конструкцията [1..n] и filter
sumOfDivisors'' :: Int -> Int
sumOfDivisors'' n = sum ( filter (\x -> n `mod` x == 0) [1..n])

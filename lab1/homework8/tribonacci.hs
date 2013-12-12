tribonacci :: Integer -> Integer
tribonacci 0 = 0
tribonacci 1 = 1
tribonacci 2 = 2
tribonacci n = tribonacci (n - 1) + tribonacci (n - 2) + tribonacci (n - 3)


Домашно 11
===========

##Задачи##
Решенията на задачите се предават по e-mail на адрес:

> radorado@hackfmi.com

За инструкции как да експериментирате с функции на Haskell дефинирани в отделен файл вижте [тук](https://github.com/IvanIvanov/fp2013/wiki/%D0%98%D0%BD%D1%81%D1%82%D0%B0%D0%BB%D0%B0%D1%86%D0%B8%D1%8F-%D0%B8-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-Haskell-Platform#%D0%9A%D0%B0%D0%BA-%D0%B4%D0%B0-%D1%81%D1%82%D0%B0%D1%80%D1%82%D0%B8%D1%80%D0%B0%D0%BC%D0%B5-%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B0%D0%BA%D1%82%D0%B8%D0%B2%D0%BD%D0%B0-%D1%81%D1%80%D0%B5%D0%B4%D0%B0-%D0%B7%D0%B0-%D0%B5%D0%BA%D1%81%D0%BF%D0%B5%D1%80%D0%B8%D0%BC%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%B0%D0%BD%D0%B5-%D1%81-haskell-repl).

### Задача 1

Отворете файла ```matrix.hs`` и имплементирайте написаните в него функции.

### Задача 2

Потоците в Haskell може да бъдат представени като безкрайни списъци.
Следният код генерира безкраен поток от просите числа:

```Haskell
primes :: [Int]
primes = filter isPrime [1..]
  where 
    divisors n = [x | x <- [1..n], n `mod` x == 0]
    sumOfDivisors n = sum $ divisors n
    isPrime n = (n + 1) == sumOfDivisors n
```

Като го използваме по следният начин:

```Haskell
take 10 primes -- [2,3,5,7,11,13,17,19,23,29]
```

Отворете файла ```streams.hs``` и имплементирайте функциите, които са описани вътре :)

### Задача 3

За да упражните рекурсивните типове,[отворете 11то домашно на 1ва група](https://github.com/IvanIvanov/fp2013/tree/master/lab1/homework11) и решете 2ра и 3та задача :)

### Весели празници!
И помнете, няма нищо по-вкусно от Коледна пържола, изядена с мисълта, че човек поназнайва Haskell :D 
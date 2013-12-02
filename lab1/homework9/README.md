Домашно 9
===========

##Задачи##
Решенията на задачите се предават по e-mail на адрес:

> ivan.vladimirov.ivanov@gmail.com

Решението на всяка задача трябва да бъде под формата на файл с окончание *.hs*, който да съдържа дефиницията на функцията (със точната сигнатура дефинирана в условието на задачата) и евентуално други помощни дефиниции, необходими за реализацията. Файловете се изпращат като attachment-и в mail-a. Освен решения на задачите самият mail трябва да съдържа име и факултен номер. Успех!

За инструкции как да експериментирате с функции на Haskell дефинирани в отделен файл вижте [тук](https://github.com/IvanIvanov/fp2013/wiki/%D0%98%D0%BD%D1%81%D1%82%D0%B0%D0%BB%D0%B0%D1%86%D0%B8%D1%8F-%D0%B8-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-Haskell-Platform#%D0%9A%D0%B0%D0%BA-%D0%B4%D0%B0-%D1%81%D1%82%D0%B0%D1%80%D1%82%D0%B8%D1%80%D0%B0%D0%BC%D0%B5-%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B0%D0%BA%D1%82%D0%B8%D0%B2%D0%BD%D0%B0-%D1%81%D1%80%D0%B5%D0%B4%D0%B0-%D0%B7%D0%B0-%D0%B5%D0%BA%D1%81%D0%BF%D0%B5%D1%80%D0%B8%D0%BC%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%B0%D0%BD%D0%B5-%D1%81-haskell-repl).

### Задача 1 ###
Едно число се нарича "четновато" (evenly), ако броят на делителите му е четно число. Да се напише функция `sumOfEvenly`, която да намери сумата от всички "четновати" числа в интервала [a, b], където a и b са цели числа и 1 <= a <= b <= 1000. Първите три "четновати" числа са 2 (делителите са 1 и 2 или общо 2 наброй), 3 (делителите са 1 и 3 или общо 2 наброй) и 5 (делителите са 1 и 5 или общо 2 наброй).

**Сигнатура:**
```Haskell
sumOfEvenly :: Int -> Int -> Int
```

**Примери:**
```Haskell
sumOfEvenly 1 10    -> 41
sumOfEvenly 1 42    -> 812
sumOfEvenly 100 200 -> 14420
```


### Задача 2 ###
Да се дефинира функция `numberToDigitList`, която получава един единствен аргумент, който е цяло неотрицателно число и връща като резултат списък от цифрите на това число.

**Сигнатура:**
```Haskell
numberToDigitList :: Int -> [Int]
```

**Примери:**
```Haskell
numberToDigitList 0      -> [0]
numberToDigitList 12     -> [1, 2]
numberToDigitList 123456 -> [1, 2, 3, 4, 5, 6]
```

### Задача 3 ###
Да се дефинира функция `prefix`, която получава като аргументи два списъка и проверява дали първия списък е префикс на втория.

**Сигнатура:**
```Haskell
prefix :: (Eq a) => [a] -> [a] -> Bool
```

**Примери:**
```Haskell
prefix [] [1, 2, 3]     -> True
prefix [1, 2, 3] []     -> False
prefix [1, 2] [1, 2]    -> True
prefix [1, 2] [1, 2, 3] -> True
prefix [1, 2] [2, 3, 4] -> False
```


##Препоръчани материали:##

* От [Learn You a Haskell for Great Good](http://learnyouahaskell.com/chapters) - [Starting Out](http://learnyouahaskell.com/starting-out) частта за списъците, [Types and Typeclasses](http://learnyouahaskell.com/types-and-typeclasses) и [Syntax in Functions](http://learnyouahaskell.com/syntax-in-functions).


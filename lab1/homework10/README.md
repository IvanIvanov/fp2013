Домашно 10
===========

##Задачи##
Решенията на задачите се предават по e-mail на адрес:

> ivan.vladimirov.ivanov@gmail.com

Решението на всяка задача трябва да бъде под формата на файл с окончание *.hs*, който да съдържа дефиницията на функцията (със точната сигнатура дефинирана в условието на задачата) и евентуално други помощни дефиниции, необходими за реализацията. Файловете се изпращат като attachment-и в mail-a. Освен решения на задачите самият mail трябва да съдържа име и факултен номер. Успех!

За инструкции как да експериментирате с функции на Haskell дефинирани в отделен файл вижте [тук](https://github.com/IvanIvanov/fp2013/wiki/%D0%98%D0%BD%D1%81%D1%82%D0%B0%D0%BB%D0%B0%D1%86%D0%B8%D1%8F-%D0%B8-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-Haskell-Platform#%D0%9A%D0%B0%D0%BA-%D0%B4%D0%B0-%D1%81%D1%82%D0%B0%D1%80%D1%82%D0%B8%D1%80%D0%B0%D0%BC%D0%B5-%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B0%D0%BA%D1%82%D0%B8%D0%B2%D0%BD%D0%B0-%D1%81%D1%80%D0%B5%D0%B4%D0%B0-%D0%B7%D0%B0-%D0%B5%D0%BA%D1%81%D0%BF%D0%B5%D1%80%D0%B8%D0%BC%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%B0%D0%BD%D0%B5-%D1%81-haskell-repl).


### Задача 1 ###
Едно число се нарича *яко* (*cool*), ако сумата от делителите му е просто число. Например първите 3 *яки* числа са 2 (1 + 2 = 3 е просто), 4 (1 + 2 + 4 = 7 е просто) и 9 (1 + 3 + 9 = 13 е просто). Да се дефинира функция `coolNumbers`, която да връща списък от всички *яки* числа в интервала [a, b].

**Сигнатура:**
```Haskell
coolNumbers :: Int -> Int -> [Int]
```

**Примери:**
```Haskell
coolNumbers 1 10  -> [2,4,9]
coolNumbers 13 42 -> [16,25]
coolNumbers 1 100 -> [2,4,9,16,25,64]
```

*Забележка:* опитайте се да решите задачата, като използвате функции от по-висок ред, като `filter` и/или `List comprehentions`, където намерите за подходящо.

### Задача 2 ###
Да се дефинира функция `squarePrimes`, която получава единствен аргумент `n` и връща безкраен списък от квадратите на всички прости числа по-големи или равни на `n` (самите прости числа трябва да са по-големи или равни на `n` а не техните квадрати).

**Сигнатура:**
```Haskell
squarePrimes :: Integer -> [Integer]
```

**Примери:**
```Haskell
take 3 (squarePrimes 1)   -> [4,9,25]
take 5 (squarePrimes 10)  -> [121,169,289,361,529]
take 7 (squarePrimes 100) -> [10201,10609,11449,11881,12769,16129,17161]
```

*Забележка:* За да избегнем изпечатването на всички елементи на безкраен списък (което би отнело извесно време), примерите използват функцията `take`, която приема произволен списък (краен или безкраен) и връща като резултат нов списък, състоящ се от първите k елемента на входния списък.

*Hint:* може да използвате комбинация от `[n..]` (където `n` е произволно цяло число) и вградените фунцкции `map`, `filter` и/или `List comprehensions`.

### Задача 3 ###
Да се дефинира функция `numbersWith`, която получава като единствен аргумент цифра (цяло едноцифрено число) и връща като резултат безкрайния списък от всички цели положителни числа (най-малкото цяло положително число е 1), които съдържат тази цифра в десетичния си запис.

**Сигнатура:**
```Haskell
numbersWith :: Integer -> [Integer]
```

**Примери:**
```Haskell
take 3 (numbersWith 1) -> [1,10,11]
take 5 (numbersWith 0) -> [10,20,30,40,50]
take 7 (numbersWith 5) -> [5,15,25,35,45,50,51]
```

*Забележка:* За да избегнем изпечатването на всички елементи на безкраен списък (което би отнело извесно време), примерите използват функцията `take`, която приема произволен списък (краен или безкраен) и връща като резултат нов списък, състоящ се от първите k елемента на входния списък.

*Hint:* може да използвате комбинация от `[1..]` и вградената фунцкция `filter` и/или `List comprehensions`.


##Препоръчани материали:##

* От [Learn You a Haskell for Great Good](http://learnyouahaskell.com/chapters) - [Starting Out](http://learnyouahaskell.com/starting-out) частта за списъците и [Higher order functions](http://learnyouahaskell.com/higher-order-functions). За интересно обсъждане на рекурсията в Haskell вижте: [Recursion](http://learnyouahaskell.com/recursion).


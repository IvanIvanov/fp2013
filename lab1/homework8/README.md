Домашно 8
===========

##Задачи##
Решенията на задачите се предават по e-mail на адрес:

> ivan.vladimirov.ivanov@gmail.com

Решението на всяка задача трябва да бъде под формата на файл с окончание *.hs*, който да съдържа дефиницията на функцията (със точната сигнатура дефинирана в условието на задачата) и евентуално други помощни дефиниции, необходими за реализацията. Файловете се изпращат като attachment-и в mail-a. Освен решения на задачите самият mail трябва да съдържа име и факултен номер. Успех!

За инструкции как да експериментирате с функции на Haskell дефинирани в отделен файл вижте [тук](https://github.com/IvanIvanov/fp2013/wiki/%D0%98%D0%BD%D1%81%D1%82%D0%B0%D0%BB%D0%B0%D1%86%D0%B8%D1%8F-%D0%B8-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-Haskell-Platform#%D0%9A%D0%B0%D0%BA-%D0%B4%D0%B0-%D1%81%D1%82%D0%B0%D1%80%D1%82%D0%B8%D1%80%D0%B0%D0%BC%D0%B5-%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B0%D0%BA%D1%82%D0%B8%D0%B2%D0%BD%D0%B0-%D1%81%D1%80%D0%B5%D0%B4%D0%B0-%D0%B7%D0%B0-%D0%B5%D0%BA%D1%81%D0%BF%D0%B5%D1%80%D0%B8%D0%BC%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%B0%D0%BD%D0%B5-%D1%81-haskell-repl).


### Задача 1 ###
Да се дефинира функция `fact2`, която да изчислява двоен факториал на неотрицателно цяло число n (n!!). n!! се дефинира по следния начин:

```
n!! = 1,             ako n = 0 или n = 1
n!! = n * (n - 2)!!, ako n >= 2
```

**Сигнатура:**
```Haskell
fact2 :: Integer -> Integer
```

**Примери:**

```Haskell
fact2 0  -> 1
fact2 1  -> 1
fact2 10 -> 3840
fact2 20 -> 3715891200
```


### Задача 2 ###
Да се дефинира функция `tribonacci`, която изчислява n-тото число на "трибоначи". Числата на трибоначи са дефинирани по следния начин:

```
tribonacci(n) = n,                                                         ако n = 0 или n = 1 или n = 2
tribonacci(n) = tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3), ако n >= 3
```

**Сигнатура:**
```Haskell
tribonacci :: Integer -> Integer
```

**Примери:**
```Haskell
tribonacci 0 -> 0
tribonacci 1 -> 1
tribonacci 2 -> 2
tribonacci 10 -> 230
```

### Задача 3 ###
Да се дефинира функция `areaOfTriangle`, която пресмята лицето на триъгълник по трите му страни, използвайки [формулата на Херон](http://www.mathopenref.com/heronsformula.html).

**Сигнатура:**
```Haskell
areaOfTriangle :: Double -> Double -> Double -> Double
```

Използвайте вградената в Haskell функция `sqrt`:
```Haskell
sqrt 4 -> 2.0
sqrt 3 -> 1.7320508075688772
```

**Примери:**

```Haskell
areaOfTriangle 1 1 1    -> 0.4330127018922193
areaOfTriangle 3 4 5    -> 6.0
areaOfTriangle 6 8 10   -> 24.0
areaOfTriangle 21 22 23 -> 208.71032557111303
```

##Препоръчани материали:##

* От [Learn You a Haskell for Great Good](http://learnyouahaskell.com/chapters) - [Introduction](http://learnyouahaskell.com/introduction) и [Starting Out](http://learnyouahaskell.com/starting-out) без списъците.


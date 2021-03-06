Домашно 10
===========

##Задачи##
Решенията на задачите се предават по e-mail на адрес:

> radorado@hackfmi.com

За инструкции как да експериментирате с функции на Haskell дефинирани в отделен файл вижте [тук](https://github.com/IvanIvanov/fp2013/wiki/%D0%98%D0%BD%D1%81%D1%82%D0%B0%D0%BB%D0%B0%D1%86%D0%B8%D1%8F-%D0%B8-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-Haskell-Platform#%D0%9A%D0%B0%D0%BA-%D0%B4%D0%B0-%D1%81%D1%82%D0%B0%D1%80%D1%82%D0%B8%D1%80%D0%B0%D0%BC%D0%B5-%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B0%D0%BA%D1%82%D0%B8%D0%B2%D0%BD%D0%B0-%D1%81%D1%80%D0%B5%D0%B4%D0%B0-%D0%B7%D0%B0-%D0%B5%D0%BA%D1%81%D0%BF%D0%B5%D1%80%D0%B8%D0%BC%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%B0%D0%BD%D0%B5-%D1%81-haskell-repl).

### Задача 1

Напишете функция ```removeAt``` която по даден индекс и списък, премахва елемента на индекса и връща новия списък. __Броим от 0__.
Ако индекса е твърде малък или твърде голям, нека функцията да връща грешка.
Използвайте вградената функция ```error :: [Char] -> a```, за да хвърлите грешката.

**Сигнатура:**

```Haskell
removeAt :: Int -> [a] -> [a]
```

**Примери:**

```Haskell
removeAt 0 [1,2,3] -- [2,3]
removeAt 1 [1,2,3] -- [1,3]
removeAt 3 [5,6,7,9] -- [5,6,7]
removeAt (-1) [1,2,3] -- "Index out of bounds"
removeAt 100 [1,2,3] -- "Index out of bounds"
```

### Задача 2

Напишете предикат ```(matchLengths)```, който приема два непразни списъка ```l1``` и ```l2``` с еднаква дължина.

Нека ```l1 = (a1 a2 a3 ... an)``` и ```l2 = (b1 b2 b3 ... bn)```. Предикатът връща истина, ако разликата между дължините на всяка двойка списъци ```(ai, bi)``` е еднаква.

#### Сигнатура ####

```Haskell
matchLengths :: [[Int]] -> [[Int]] -> Bool
```
#### Примери ####

```Haskell
matchLengths [ [], [1, 2], [3, 4, 5] ] [ [1], [2,3,4], [5,6,7,8] ] -- True
matchLengths [ [], [1,2], [3,4,5] ] [ [], [2,3,4], [5,6,7] ] -- False
matchLengths [ [1..9], [10..19] ] [ [1,2,3], [1,2,3,4] ] -- True
```

### Задача 3

Напишете функция ```letterOfTheMost```, която приема списък от думи и връща tuple, чийто първи елемент е най-срещаната буква от всички думи, а втория елемент е броят на нейните срещанията.
__Да не се прави разлика между малки и главни букви.__

__Подсказка__
Следните два реда код в началото на програма може да са ви полезни:
```import Data.List``` ще ви даде ```sort``` функцията
```import Data.Char``` Ще ви даде ```toLower``` функцията

#### Сигнатура ####

```Haskell
letterOfTheMost :: [String] -> (Char, Int)
```

#### Примери ####

```Haskell
letterOfTheMost ["haskell", "javascript", "scheme", "C++", "Clojure", "C++"] -- ('c',5)
letterOfTheMost $ words "The quick brown fox jumped over the lazy dog" -- ('o',4)
letterOfTheMost ["aaaaaaaaa", "bbbbbbb", "cccccccccc", "dddddddddddd"] -- ('d',12)
```

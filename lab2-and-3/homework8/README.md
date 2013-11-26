Домашно 8
===========

##Задачи##
Решенията на задачите се предават по e-mail на адрес:

> radorado@hackfmi.com

Решението на всяка задача трябва да бъде под формата на файл с окончание *.hs*, който да съдържа дефиницията на функцията (със точната сигнатура дефинирана в условието на задачата) и евентуално други помощни дефиниции, необходими за реализацията. Файловете се изпращат като attachment-и в mail-a. Освен решения на задачите самият mail трябва да съдържа име и факултен номер. Успех!

За инструкции как да експериментирате с функции на Haskell дефинирани в отделен файл вижте [тук](https://github.com/IvanIvanov/fp2013/wiki/%D0%98%D0%BD%D1%81%D1%82%D0%B0%D0%BB%D0%B0%D1%86%D0%B8%D1%8F-%D0%B8-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-Haskell-Platform#%D0%9A%D0%B0%D0%BA-%D0%B4%D0%B0-%D1%81%D1%82%D0%B0%D1%80%D1%82%D0%B8%D1%80%D0%B0%D0%BC%D0%B5-%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B0%D0%BA%D1%82%D0%B8%D0%B2%D0%BD%D0%B0-%D1%81%D1%80%D0%B5%D0%B4%D0%B0-%D0%B7%D0%B0-%D0%B5%D0%BA%D1%81%D0%BF%D0%B5%D1%80%D0%B8%D0%BC%D0%B5%D0%BD%D1%82%D0%B8%D1%80%D0%B0%D0%BD%D0%B5-%D1%81-haskell-repl).

### Задача 1

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

### Задача 2

Напишете функция, която пресмята сумата на всички цифри на дадено число.

**Сигнатура:**

```haskell
digitsSum :: Int -> Int
```

Използвайте инфиксните оператори ```haskell `mod` ``` и ```haskell `div` ```

```haskell
454 `mod` 10 -> 4
454 `div` 10 -> 45
7 `div` 2 -> 3
```

**Примери:**

```haskell
digitsSum 10 -- 1
digitsSum 100 -- 1
digitsSum 1500 -- 6
digitsSum 123456 -- 21
digitsSum 9999999 -- 63
digitsSum 123456789 -- 45
```

### Задача 3

Едно число се нарича **"простовато" (primy)**, ако броят на делителите му е просто число. Да се напише функция ```sumOfPrimy```, която да намери сумата от всички "простовати" числа в интервала ```[a, b]```, където a и b са цели числа и ```1 <= a <= b <= 1000```. Първите три "простовати" числа са 2 (делителите са 1 и 2 или общо 2 (просто число) наборой), 3 (делителите са 1 и 3 или общо 2 (просто число) на брой) и 5 (делителите са 1 и 5 или общо 2 (просто число) на брой).

Може да използвате генерирането на списъци ```haskell [a..b]``` и вграденият [filter](http://zvon.org/other/haskell/Outputprelude/filter_f.html)

А може и да не ги използвате :)

**Сигнатура:**
```haskell
sumOfPrimy :: Int -> Int -> Int
```

**Примери:**

```haskell
sumOfPrimy 1 10	-- 30 защото 2 + 3 + 4 + 5 + 7 + 9 = 30
sumOfPrimy 100 200 -- 3457
sumOfPrimy 1 42	-- 292
```

### Препоръчани материали

* От [Learn You a Haskell for Great Good](http://learnyouahaskell.com/chapters) - [Introduction](http://learnyouahaskell.com/introduction) и [Starting Out](http://learnyouahaskell.com/starting-out) без списъците.
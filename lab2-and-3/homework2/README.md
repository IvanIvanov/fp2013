Домашно 2
===========

##Задачи##

Решенията на задачите се предават по e-mail на адрес:

> radorado@hackfmi.com

Решението на всяка задача трябва да бъде под формата на файл с окончание *.scm* или *.rkt*, който да съдържа дефиницията на функцията (със точната сигнатура дефинирана в условието на задачата) и евентуално други помощни дефиниции, необходими за реализацията. Файловете се изпращат като attachment-и в mail-a. Освен решения на задачите самият mail трябва да съдържа име и факултен номер. Успех!

### Задача 1 ###

Напишете функция, която смята сумата на делителите на дадено число ```n```

#### Сигнатура ####

```scheme
(define (sum-of-divisors n) ...)
```

Например, делителите на числото ```9``` са 1, 3 и 9 и тяхната сума е ```1+3+9 = 13```

#### Примери ####

```scheme
(sum-of-divisors 3) ; 4
(sum-of-divisors 7) ; 8
(sum-of-divisors 8) ; 15
(sum-of-divisors 9) ; 13
(sum-of-divisors 12345789); 16461056 
```

### Задача 2 ###

Напишете фунцкия, която смята сумата на всички прости числа в даден интервал ```[start, end]```

#### Сигнатура ####

```scheme
(define (sum-of-primes-in-range start end) ...)
```

#### Примери ####

```scheme
(sum-of-primes-in-range 0 10) ; 17
(sum-of-primes-in-range 8 10) ; 0
(sum-of-primes-in-range 100 200) ; 3167
(sum-of-primes-in-range 0 10000) ; 5736396
```

### Задача 3 ###

Напишете фунцкия, която проверява дали дадено цяло число е палиндром.
Палиндром означава, че като го запишем отзад напред, пак получаваме същото число.

#### Сигнатура ####

```scheme
(define (is-int-palindrom? n) ...)
```

#### Примери ####

```scheme
(is-int-palindrom? 0) ; #t
(is-int-palindrom? 1) ; #t
(is-int-palindrom? 2) ; #t
(is-int-palindrom? 5) ; #t
(is-int-palindrom? 10) ; #f
(is-int-palindrom? 101) ; #t
(is-int-palindrom? 10101) ; #t
(is-int-palindrom? 123123) ; #f 
(is-int-palindrom? 666) ; #t
(is-int-palindrom? 1230912098312030912309129873821) ; #f
```

##Препоръчани материали##
* [Материал за Tail Recursion](http://blogs.msdn.com/b/ashleyf/archive/2010/02/06/recursion-is-the-new-iteration.aspx)
* [What is Tail Recursion?](http://stackoverflow.com/questions/33923/what-is-tail-recursion)
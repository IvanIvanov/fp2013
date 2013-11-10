# Първо домашно

[Инструкции за домашните](https://github.com/IvanIvanov/fp2013/tree/master/lab4#%D0%94%D0%BE%D0%BC%D0%B0%D1%88%D0%BD%D0%B8).

[Инструкции за тестовете](https://github.com/IvanIvanov/fp2013/tree/master/lab4/testing-tool#%D0%9A%D0%B0%D0%BA-%D1%81%D0%B5-%D0%BF%D1%83%D1%81%D0%BA%D0%B0%D1%82-%D1%82%D0%B5%D1%81%D1%82%D0%BE%D0%B2%D0%B5%D1%82%D0%B5).

Ако имате затруднения или въпроси, пишете смело (:

## Краен срок за предаване

20.10.2013г. включително.

## Задача 1

Напишете функция `fizzbuzz`, която приема число и връща:

* `"fizz"`, ако числото се дели на 3.
* `"buzz"`, ако числото се дели на 5.
* `"fizzbuzz"`, ако числото се дели на 3 и на 5.
* самото числото, ако нито от горните условия не е изпълнено.

**Сигнатура:**

```scheme
(define (fizzbuzz n)
  ...)
```

**Примери:**

```scheme
(fizzbuzz 42) ;=> "fizz"
(fizzbuzz 25) ;=> "buzz"
(fizzbuzz 45) ;=> "fizzbuzz"
(fizzbuzz 13) ;=> 13
```

## Задача 2

Напишете функция `contains-digit?`, която приема два аргумента (`number` и `digit`)
и връща:

* `#t`, ако числото `number` съдържа цифрата `digit`.
* `#f`, в противен случай.

**Сигнатура:**

```scheme
(define (contains-digit? number digit)
  ...)
```

**Примери:**

```scheme
(contains-digit? 9122 1) ;=> #t
(contains-digit? 3 3)    ;=> #t
(contains-digit? 4286 3) ;=> #f
(contains-digit? 0 7)    ;=> #f
```

## Задача 3

Напишете функция `mis?` (monotonically increasing sequence), която проверява
дали цифрите на дадено число образуват монотонно растяща редица.
Съответно връща `#t` или `#f`.

**Сигнатура:**

```scheme
(define (mis? n)
  ...)
```

**Примери:**

```scheme
(mis? 73689) ;=> #f
(mis? 3689)  ;=> #t
(mis? 12248) ;=> #t
(mis? 8)     ;=> #t
(mis? 333)   ;=> #t
(mis? 9752)  ;=> #f
```

## Насоки

За втора и трета задача, вградените функции `remainder` и `quotient` биха ви свършили добра работа (:

```scheme
(remainder 123 10) ;=> 3
(quotient 123 10)  ;=> 12
```

## Препоръчани материали

[Тук.](https://github.com/IvanIvanov/fp2013/blob/master/lab1/homework1/homework1.md#%D0%9F%D1%80%D0%B5%D0%BF%D0%BE%D1%80%D1%8A%D1%87%D0%B0%D0%BD%D0%B8-%D0%BC%D0%B0%D1%82%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B8)

## Котки

[Котка#1](http://9gag.com/gag/a8Wo47Q),
[Котка#2](http://www.youtube.com/watch?v=PcLxmFgCxt8),
[Котка#3](http://1-ps.googleusercontent.com/h/www.catgifpage.com/gifs/194.gif.pagespeed.ce.hXMShQgSmm.gif).

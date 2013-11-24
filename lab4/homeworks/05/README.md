# Пето домашно

[Инструкции за домашните](https://github.com/IvanIvanov/fp2013/tree/master/lab4#%D0%94%D0%BE%D0%BC%D0%B0%D1%88%D0%BD%D0%B8).

[Инструкции за тестовете](https://github.com/IvanIvanov/fp2013/tree/master/lab4/testing-tool#%D0%9A%D0%B0%D0%BA-%D1%81%D0%B5-%D0%BF%D1%83%D1%81%D0%BA%D0%B0%D1%82-%D1%82%D0%B5%D1%81%D1%82%D0%BE%D0%B2%D0%B5%D1%82%D0%B5).

## Краен срок за предаване

28.11.2013г. включително.

## Задача 1

**Сигнатура:**

Напишете функция `replicate`, която приема списък `l`, естествено число `n` и
замества всеки елемент от `l` със себе си `n` пъти.

```scheme
(define (replicate l n)
  ...)
```

**Примери:**

```scheme
(replicate '(a b c) 1) ;=> (a b c)
(replicate '(a b c) 2) ;=> (a a b b c c)
(replicate '(a b a) 3) ;=> (a a a b b b a a a)
(replicate '(a b c) 3) ;=> (a a a b b b c c c)
(replicate '(a b c) 4) ;=> (a a a a b b b b c c c c)
```

## Задача 2

Напишете функция `each-with-index`, която приема списък `l` и връща списък от
списъци с по два елемента - `(индекс, елемент)`.

**Сигнатура:**

```scheme
(define (each-with-index l)
  ...)
```

**Примери:**

```scheme
(each-with-index '(1 2 3)) ;=> ((0 1) (1 2) (2 3))
(each-with-index '(a b c)) ;=> ((0 a) (1 b) (2 c))
```

## Задача 3

Напишете функция `slice`, която приема списък `l`, начална позиция `start`, крайна
позиция `end` и връща списък с елементите от `l`, чиито позиции са в интервала
`[start, end]`.

**Сигнатура:**

```scheme
(define (slice l start end)
  ...)
```

**Примери:**

```scheme
(slice '(a b c d e f g h i k) 3 7)  ;=> (d e f g h)
(slice '(a b c d e f g h i k) 0 3)  ;=> (a b c d)
(slice '(a b c d e f g h i k) 3 33) ;=> (d e f g h i k)
(slice '(a b c d e f g h i k) 3 0)  ;=> ()
(slice '(a b c d e f g h i k) 3 3)  ;=> (d)
```

**Детайли:**

* Интервалът включва както `start` така и `end`;

* Ако `start` > `end`, функцията връща празен списък;

* Ако `end` > дължината на `l`, функцията връща елементите от `start` до
края на `l`;

* Приемете, че `start` и `end` са положителни цели числа;

* Първата позиция в списък е 0.

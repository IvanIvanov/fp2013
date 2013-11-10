# Трето домашно

[Инструкции за домашните](https://github.com/IvanIvanov/fp2013/tree/master/lab4#%D0%94%D0%BE%D0%BC%D0%B0%D1%88%D0%BD%D0%B8).

[Инструкции за тестовете](https://github.com/IvanIvanov/fp2013/tree/master/lab4/testing-tool#%D0%9A%D0%B0%D0%BA-%D1%81%D0%B5-%D0%BF%D1%83%D1
%81%D0%BA%D0%B0%D1%82-%D1%82%D0%B5%D1%81%D1%82%D0%BE%D0%B2%D0%B5%D1%82%D0%B5).

## Disclaimer

Понеже не успях да дам навреме третото домашно, бях решил въобще да не давам,
но тъй като изявихте желание все пак да ви дам такова, ето го и него (:

Имате две седмици срок, за да го направите.

## Краен срок за предаване

10.11.2013г. включително.

## Задача 1

Реализирайте функцията `accumulate` (която имплементирахме по време на
упражнения) итеративно.

**Сигнатура:**

```scheme
(define (accumulate a b null-value operator f next)
  ...)
```

**Примери:**

```scheme
(define (identity x)
  x)

(define (inc x)
  (+ x 1))

(accumulate 1 10 0 + identity inc) ;=> 55
(accumulate 1 10 1 * identity inc) ;=> 3628800
```

## Задача 2

Напишете функция `filter-and-accumulate`, която приема същите параметри като
`accumulate` плюс параметъра `pred?` (представляващ предикат) и акумулира само
тези стойности, за които `pred?` е истина (`#t`).

**Сигнатура:**

```scheme
(define (filter-and-accumulate pred? a b null-value operator f next)
  ...)
```

**Примери:**

```scheme
(define (identity x)
  x)

(define (inc x)
  (+ x 1))

(filter-and-accumulate even? 1 10 0 + identity inc) ;=> 30
(filter-and-accumulate odd? 1 10 1 * identity inc)  ;=> 945
```

## Задача 3

Напишете функция `divisor-count`, която приема число `n`, интервал `[a, b]` и
връща броя на делителите на `n` в интервала `[a, b]`.

**Сигнатура:**

```scheme
(define (divisor-count n a b)
  ...)
```

**Примери:**

```scheme
(divisor-count 10 1 10) ;=> 4
(divisor-count 4 1 10)  ;=> 3
(divisor-count 42 1 10) ;=> 5
```

**Hint**

Използвайте `filter-and-accumulate`, за да решите задачата. Ще ви улесни доста.

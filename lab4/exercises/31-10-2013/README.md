5-то упражнение - `map`, `filter` и `reduce`
============================================

## Map

Функция от по-висок ред, която приема функция на един аргумент и списък и връща
нов списък, получен като на всеки елемент от подадения списък се прилага
подадената функция.

### Имплементация

**Рекурсия:**

```scheme
(define (my-map f l)
  (if (null? l)
      '()
      (cons (f (car l)) (my-map f (cdr l)))))
```

**Опашкова рекурсия:**

```scheme
(define (my-map f l)
  (let loop ((collection l)
             (result '()))
    (if (null? collection)
        (reverse result)
        (loop (cdr collection) (cons (f (car collection)) result)))))
```

### Пример

```scheme
(map (lambda (x) (* x x)) '(1 2 3 4 5)) ;=> '(1 4 9 16 25)
```

# Filter

Функция от по-висок ред, която приема функция на един аргумент (предикат) и списък
и връща нов списък, който се състои само от тези елементи на подадения списък, за
които предикатът връща истина.

### Имплементация

**Рекурсия:**

```scheme
(define (filter pred l)
  )
```

**Опашкова рекурсия:**

```scheme
(define (filter pred l)
  (let loop ((sequence l) (filtered '()))
    (cond ((null? sequence)
           filtered)
          ((pred (car sequence))
           (loop (cdr sequence) (append filtered (list (car sequence)))))
          (else (loop (cdr sequence) filtered)))))
```

### Пример

```scheme
(filter even? '(1 2 3 4 5 6 7 8 9 10)) ;=> '(2 4 6 8 10)
```

# Reduce

Функция от по-висок ред, която приема функция на два аргумента, начална стойност
и списък и свежда списъка до единична стойност, прилагайки функцията върху
елементите му.

### Имплементация

**Рекурсия:**

```scheme
(define (reduce f init-val l)
  )
```

**Опашкова рекурсия:**

```scheme
(define (reduce f init-val l)
  (let loop ((sequence l) (reduced init-val))
    (if (null? sequence)
        reduced
        (loop (cdr sequence) (f reduced (car sequence))))))
```

### Пример

```scheme
(reduce + 0 '(1 2 3 4 5 6 7 8 9 10)) ;=> 55
```

## Кога да ползваме `map`, `filter` и `reduce`?

Грубо казано:

* Ако **имаме** редица с дължина n и **искаме** редица с дължина n, използваме `map`.
* Ако **имаме** редица с дължина n и **искаме** редица с дължина по-малка от n, използваме `filter`.
* Ако **имаме** редица с дължина n и **искаме** да я сведем до единична стойност, използваме `reduce`.

# Results from homework 4

## Veselin Genadiev, 80927

**Test log:**

```
 Final Results:
   Assertions: 34
   Passed: 34
   Failed: 0

```

## Liliya Lyubenova, 80861

**Test log:**

```
 Final Results:
   Assertions: 34
   Passed: 34
   Failed: 0

```

## Hristo Dimitrov, 80805

**Test log:**

```
 Final Results:
   Assertions: 34
   Passed: 34
   Failed: 0

```

## Izabel Gandileva, 80852

**Test log:**

```
 Final Results:
   Assertions: 34
   Passed: 34
   Failed: 0

```

## Denis Bialev, 80833

**Test log:**

```
 Final Results:
   Assertions: 34
   Passed: 34
   Failed: 0

```

## Georgi Purnarov, 80856

**Test log:**

```
 Final Results:
   Assertions: 34
   Passed: 34
   Failed: 0

```

## Antonio Nikolov, 80867

**Test log:**

```
 Final Results:
   Assertions: 34
   Passed: 34
   Failed: 0

```

## Nelly Panayotova, 80837

**Test log:**

```
 Final Results:
   Assertions: 34
   Passed: 34
   Failed: 0

```

## Bozhidar Mihaylov, 80797

**Test log:**

```
 Final Results:
   Assertions: 34
   Passed: 34
   Failed: 0

```

## Georgi Georgiev, 80829

**Test log:**

```
 Final Results:
   Assertions: 34
   Passed: 34
   Failed: 0

```

## Sasho Mihailov, 80821

**Test log:**

```
mcdr: contract violation
  expected: mpair?
  given: ()
  context...:
   /home/hristo/fmi/functional-programming-2013-2014/submitted-solutions/04/homework4_Sasho_Mihailov_80821.scm:51:0: sequence-order?
   /home/hristo/fmi/functional-programming-2013-2014/submitted-solutions/04/tests.scm:21:0: sequence-order?-test
   /usr/lib/racket/collects/r5rs/run.rkt: [running body]
```

Решението ти на четвърта задача гърми при следните примери:

```scheme
(define-test sequence-order?-test
  (assert (sequence-order? < '())           #t)
  (assert (sequence-order? < '(1))          #t)
  ...
  (assert (sequence-order? > '())           #t)
  (assert (sequence-order? > '(1))          #t)
  ...
  (assert (sequence-order? = '())           #t)
  (assert (sequence-order? = '(3))          #t)
  ...)
```

Реално имаш 28 верни от 34 примера.

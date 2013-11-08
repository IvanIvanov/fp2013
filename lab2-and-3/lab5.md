# 5то упражнение - Функции от по-висок ред върху списъци

Задачи, които решавахме на 5тото упражнение.

## reduce

Функция, която приема списък, оператор на два аргумента и начална стойност и ни връща скалар (единична стойност).
Редуцира списък до единична (скаларна) стойност.

### Имплементация
```scheme
(define (reduce oper start_value l)
    (cond
        ((null? l) start_value)
        (else (reduce oper (oper (car l) start_value) (cdr l)))))
```

### Примерно използване
```scheme
    (reduce + 0 (list 1 2 3)) ;;; ще сумира числата в списъка
    (reduce (lambda (x y) (or x y)) #f (list #t #f #t)) ;;; ще ни върне #t ако има поне една истина в списъка
```

## map

```map``` е функция, която приема списък и едноаргументна функция и ни връща нов списък, където всеки елемент е извикан с дадената функция.
```map : [a1, a2, a3, ..., an], f -> [f(a1), f(a2), f(a3), ... , f(an)]```

### Имплементация с опашкова рекурсия
```scheme
(define (mymap f l)
  (define (mymap-iter f l result)
    (cond
      ( (null? l) result)
      (else (mymap-iter f (cdr l) (cons (f (car l)) result)))))

  (reverse (mymap-iter f l '())))
```

### Имплементация със стандартна рекурсия
```scheme
(define (mymap-rec f l)
  (cond
    ((null? l) '())
    (else (cons (f (car l)) (mymap-rec f (cdr l))))))
```

### Примерно използване
```scheme
(mymap (lambda (x) (* x x )) (list 1 2 3)) ;;; (1 4 9)
```

### Вградена функция в Scheme

В Scheme съществува функцията ```map```, която може да използваме наготово.
Тя приема за първи аргумент функцията, а за втори списъка.

## filter
```filter``` е функция, която приема списък и едноаргументен предикат и връща нов списък, който се състои само от тези елементи, за които предиката връща истина

``` filter: [a1, a2, a3], pred? -> [ai | (pred? ai) == #t]```

### Имплементация с опашкова рекурсия
```scheme
(define (filter l pred?)
  (define (filter-iter l pred? result)
    (cond
      ( (null? l) result)
      ( (pred? (car l)) (filter-iter (cdr l) pred? (cons (car l) result)))
      (else (filter-iter (cdr l) pred? result))))

  (reverse (filter-iter l pred? '())))
```

### Имплементация със стандартна рекурсия
```scheme
(define (filter-rec l pred?)
  (cond
    ( (null? l) '())
    ( (pred? (car l)) (cons (car l) (filter-rec (cdr l) pred?)))
    (else (filter-rec (cdr l) pred?))))
```

### Примерно използване
```scheme
(filter (list 1 2 3 4 5 6 7 8) odd?) ;;; (1 3 5 7)
```

## sum-of-n чрез range и reduce

Идеята е да се напише
```scheme
(define (sum-of-n n) ... )
```
чрез ```range``` и ```reduce```

### Имплементация
```scheme
(define (sum-of-n n)
    (reduce (range 1 n) + 0))
```

### Примерно използване
```scheme
(sum-of-n 4) ;;; 10
```

## any?
```any?``` е функция, която взима списък и предикат и връща ```#t``` ако поне един елемент от списъка връща истина, подаден като аргумент на предиката.
Ако няма такъв елемент, функцията връща ```#f```

### Имплементация
```scheme
(define (any? l pred?)
  (> (length (filter l pred?)) 0))
```

### Примерно използване
```scheme
(any? (list 1 3 5 7) (lambda (x) (= (remainder x 2) 0))) ;;; #f
```

## all?

```all``` е функция, която взима списък и предикат и връща ```#t``` ако всички елементи от списъка отговорят с ```#t``` на извикване с предиката.
Ако дори един елемент не отговаря на изискването в предиката, функцията връща ```#f```

### Имплементация
```scheme
(define (all? l pred?)
  (= (length (filter l pred?)) (length l)))
```

### Примерно използване
```scheme
(all? (list 1 1 1 1) (lambda (x) (= x 1))) ;;; #t
```

## reject

Това е обратната фукнция на ```filter```. Ако ```filter``` връща всички елементи, отговарящи с истина на предиката, то ```reject``` връща всички елементи, отговарящи с лъжа на него.

### Имплементация
Тук идеята е, че използваме вече написания filter, като подаваме lambda функция, която отрича предиката, за да ни свърши работа.

```scheme
(define (reject l pred?)
  (filter l (lambda (x) (not (pred? x)))))
```

### Примерно използване
```scheme
(reject (range 1 10) odd?) ;;; (2 4 6 8 10)
```

## take

Функцията ```take``` приема два аргумента - ```l``` и ```n``` и връща първите ```n``` елемента на списъка ```l```

### Имплементация с опашкова рекурсия
```scheme
(define (take l n)
  (define (take-iter l n result)
    (cond
      ((or (null? l) (<= n 0)) result)
      (else (take-iter (cdr l) (- n 1) (cons (car l) result)))))

  (reverse (take-iter l n (list))))
```

### Имплементация със стандартна рекурсия
```scheme
(define (take l n)
  (cond
    ((or (null? l) (<= n 0)) '())
    (else (cons (car l) (take (cdr l) (- n 1))))))
```

### Примерно използване
```scheme
(take (range 1 10) 5) ;;; (1 2 3 4 5)
```

## drop

```drop``` е обратната на ```take``` - премахва първите n елемента от даден списък.

### Имплементация с ```take```
```scheme
(define (drop l n)
  (reverse (take (reverse l) (- (length l) n))))
```
### Имплементация с опашкова рекурсия
```scheme
(define (drop l n)
  (cond
    ((or (null? l) (<= n 0)) l)
    (else (drop (cdr l) (- n 1)))))
```

### Примерно използване
```scheme
(drop (range 1 10) 5) ;;; (6 7 8 9 10)
```

## drop-while

drop-while приема списък и предикат и маха елементи от началото на списъка, докато предиката не върне стойност ```#f```, след което връща това, което е останало от списъка

### Имплементация

```scheme
(define (drop-while l pred?)
  (cond
    ( (null? l) (list))
    ( (not (pred? (car l))) l)
    (else (drop-while (cdr l) pred?))))
```

### Примерно използване
```scheme
(drop-while (list 0 0 0 0 1 2 3) (lambda (x) (= x 0))) ;;; (1 2 3)
```

## remove-trailing

```scheme
(remove-trailing l n)
```
премахва всички срещания на числото ```n```, започвайки отзад на списъка.
При първото срещане на число, различно от ```n```, функцията спира и връща останалия списък.

### Имплементация
```scheme
(define (remove-trailing l n)
  (reverse (drop-while (reverse l) (lambda (x) (= x n)))))
```

### Примерно използване
```scheme
(remove-trailing (list 0 0 0 0 1 2 3 3 3) 3) ;;; (0 0 0 0 1 2)
```

## remove-leading

```scheme
(remove-leading l n)
```

e като ```remove-trailing```, само че започва маханeто на даденото число ```n``` от началото на списъка.

### Имплементация
```scheme
(define (remove-leading l n)
  (drop-while l (lambda (x) (= x n))))
```

### Примерно използване
```scheme
(remove-leading (list 0 0 0 0 1 2 3 3 0 3 0) 0) ;;; (1 2 3 3 0 3 0)
```

## count-n

```scheme
(count-n l n)
```
връща срещанията на числото ```n``` в списъка ```l```

### Имплементация с ```map``` и ```reduce```
```scheme
(define (count-n l n)
  (reduce (mymap l (lambda (x) (if (= x n) 1 0))) + 0))
```

### Имплементация с опашкова рекурсия
```scheme
(define (count-n l n)
  (define (count-n-iter l n result)
    (cond
      ((null? l) result)
      ((= (car l) n) (count-n-iter (cdr l) n (+ result 1)))
      (else (count-n-iter (cdr l) n result))))

  (count-n-iter l n 0))
```

### Имплементация със стандартна рекурсия
```scheme
(define (count-n l n)
  (cond
    ((null? l) 0)
    ((= (car l) n) (+ 1 (count-n (cdr l) n)))
    (else (count-n (cdr l) n))))
```

### Примерно използване
```scheme
(count-n (list 1 2 3 4 5 6 1 0 1) 1) ;;; 3
(count-n (list 0 1 2 3) 4) ;;; 0
```

## map-argument

```scheme
(map-argument list-of-functions x)
```
приема списък от едноаргументи функции и цяло число ```x```, като връща нов списък, съставен от резултатът на всички функции, извикани с аргумент ```x```

### Имплементация
```scheme
(define (map-argument list-of-functions x)
  (mymap list-of-functions (lambda (f) (f x))))
```

### Примерно използване
```scheme
(map-argument (list (lambda (x) (+ x 1))
                    (lambda (x) (* x 2))
                    (lambda (x) (sqrt x)))
              9)  ;;; (10 18 3)
```

## prefix?

```scheme
(prefix? l1 l2)
```
връща истина, ако списъкът ```l1``` е префикс на списъка ```l2```

### Имплементация
```scheme
(define (prefix? l1 l2)
  (equal? l1 (take l2 (length l1))))
```

### Примерно използване
```scheme
(prefix? (range 1 3) (range 1 10)) ;;; #t
(prefix? (range 1 3) (range 0 10)) ;;; #f
(prefix? (range 1 3) (range 1 2))  ;;; #f
```

## take-while

take-while приема списък и предикат и взима елементи от началото на списъка, докато предиката не върне стойност ```#f```, след което връща това, което е взето от списъка

### Имплементация с опашкова рекурсия
```scheme
(define (take-while l pred?)
  (define (take-while-iter l pred? result)
    (cond
      ((or (null? l) (not (pred? (car l)))) result)
      (else (take-while-iter (cdr l) pred? (cons (car l) result)))))

(reverse (take-while-iter l pred? '())))
```

### Имплементация със стандартна рекурсия
```scheme
(define (take-while l pred?)
  (cond
    ((or (null? l) (not (pred? (car l)))) '())
    (else (cons (car l) (take-while (cdr l) pred?)))))
```

### Примерно използване
```scheme
(take-while (list 1 3 5 2 9 0) (lambda (x) (not (= (remainder x 2) 0)))) ;;; (1 3 5)
```

## do-while

```scheme
(do-while l f pred?)
```
взима списък и връща нов списък, който се строи по следния начин:
Функцията започва да ходи по списъка и докато ```pred?``` връща истина за поредния елемент, този елемент се заменя със стойността на ```f``` от него.

### Имплементация с ```take-while```, ```drop-while``` и ```map```
```scheme
(define (do-while l f pred?)
  (append (mymap (take-while l pred?) f) (drop-while l pred?)))
```

### Имплементация с опашкова рекурсия
```scheme
(define (do-while l f pred?)
  (define (do-while-iter l f pred? result)
    (cond
      ((or (null? l) (not (pred? (car l)))) (append (reverse result) l))
      (else (do-while-iter (cdr l) f pred? (cons (f (car l)) result)))))

  (do-while-iter l f pred? '()))
```

### Имплементация със стандартна рекурсия
```scheme
(define (do-while l f pred?)
  (cond
    ((or (null? l) (not (pred? (car l)))) l)
    (else (append (list (f (car l))) (do-while (cdr l) f pred?)))))
```

### Примерно използване
```scheme
(do-while (list 0 0 0 2 3 4) (lambda (x) (+ x 1)) (lambda (x) (= x 0)) ) ; (1 1 1 2 3 4)
```

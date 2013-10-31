;;; Creating pairs with cons and accessing their elements with car and cdr.
(define p1 (cons 1 2))
(car p1) ; 1
(cdr p1) ; 2
(define p2 (cons 3 4))
(define p3 (cons p1 p2))
(cdr (car p3)) ; 2
(car (cdr p3)) ; 3
(car (car p3)) ; 1
(cdr (cdr p3)) ; 4
(cdar p3) ; 2
(cadr p3) ; 3
(caar p3) ; 1
(cddr p3) ; 4

;; The empty list.
'()

;; Creating a list with cons.
(cons 1 (cons 2 (cons 3 (cons 4 '()))))

;; Creating a list with the list function.
(list 1 2 3 4)

;;; Creating a list with the quote operator.
'(1 2 3 4)

;;; Another way to create a list with the quote operator.
(quote (1 2 3 4))

;;; This is the wrong way to create a list:
;;;  (1 2 3 4)

;;; Finding the length of a list (length is a built-in function).
(define (length2 items)
  (if (null? items)
      0
      (+ 1 (length2 (cdr items)))))

(length2 '(1 2 3 4)) ; 4

;;; Finding the n'th element of a list. The first element of the list
;;; is denoted by n = 0.
(define (nth n items)
  (if (= n 0)
      (car items)
      (nth (- n 1) (cdr items))))

(nth 0 '(1 2 3 4)) ; 1
(nth 3 '(1 2 3 4)) ; 4

;;; Appending two lists (append is a built-in function).
(define (append2 list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (append2 (cdr list1) list2))))

(append2 '(1 2) '(3 4 5)) ; (1 2 3 4 5)

;;; A function that scales the elements of a list by a factor.
(define (scale-list factor items)
  (if (null? items)
      '()
      (cons (* factor (car items))
            (scale-list factor (cdr items)))))

(scale-list 10 '(1 2 3 4)) ; (10 20 30 40)

;;; A function that squares the elements of a list.
(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square x)
  (* x x))

(square-list '(1 2 3 4)) ; (1 4 9 16)

;;; General higher-order function to apply a function f to each element
;;; of a list and return a new list with the results of the function (map
;;; is a built-in function).
(define (map2 f items)
  (if (null? items)
      '()
      (cons (f (car items))
            (map2 f (cdr items)))))

;;; A function that scales the elements of a list by a factor - alternative
;;; implementation.
(define (scale-list2 factor items)
  (map2 (lambda (x) (* factor x)) items))

(scale-list2 10 '(1 2 3 4)) ; (10 20 30 40)

;;; A function that squares the elements of a list - alternative implementation.
;;; Using built-in map instead of map2.
(define (square-list2 items)
  (map square items))

(square-list2 '(1 2 3 4)) ; (1 2 3 4)

;;; Generate a list with all integers in the range [a, b].
(define (range a b)
  (if (> a b)
      '()
      (cons a (range (+ a 1) b))))

(range 1 10) ; (1 2 3 4 5 6 7 8 9 10)

;;; A function that filters all elements of a list by only keeping those
;;; elements that satisfy a predicate given as an argument.
(define (filter predicate items)
  (cond ((null? items) '())
        ((predicate (car items))
         (cons (car items) (filter predicate (cdr items))))
        (else (filter predicate (cdr items)))))

(filter even? (range 0 10)) ; (0 2 4 6 8 10)

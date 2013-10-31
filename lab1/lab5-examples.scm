;;; Reverse the elements of a list (reverse is a built-in function).
;;; O(n^2) time complexity.
(define (reverse2 items)
  (if (null? items)
      '()
      (append (reverse (cdr items))
              (list (car items)))))

(reverse2 '(1 2 3 4)) ; (4 3 2 1)

;;; Reverse the elements of a list. O(n) time complexity.
(define (reverse3 items)
  (reverse-iter items '()))

(define (reverse-iter items result)
  (if (null? items)
      result
      (reverse-iter (cdr items) (cons (car items) result))))

(reverse3 '(1 2 3 4)) ; (4 3 2 1)

;;; Use equal? instead of = to deeply compare more general things numbers.
(equal? 1 1) ; #t
(equal? 1 2) ; #f
(equal? '(1 2 3) '(1 2 3)) ; #t
(equal? '(1 2 3) '(1 2)) ; #f

;;; Check whether an element x is contained in a list.
(define (member? x items)
  (cond ((null? items) #f)
        ((equal? x (car items)) #t)
        (else (member? x (cdr items)))))

(member? 3 '(1 2 3 4 5)) ; #t
(member? 0 '(1 2 3 4 5)) ; #f

;;; Checks whether list1 is a suffix of list2.
(define (suffix list1 list2)
  (cond ((equal? list1 list2) #t)
        ((null? list2) #f)
        (else (suffix list1 (cdr list2)))))

(suffix '(3 4) '(1 2 3 4)) ; #t
(suffix '(5) '(1 2 3 4)) ; #f

;;; Checks whether list1 is a prefix of list2.
(define (prefix list1 list2)
  (cond ((null? list1) #t)
        ((null? list2) #f)
        ((equal? (car list1) (car list2)) (prefix (cdr list1) (cdr list2)))
        (else #f)))

(prefix '(3 4) '(1 2 3 4)) ; #f
(prefix '(1 2) '(1 2 3 4)) ; #t

;;; Checks whether list1 is a prefix of list2 - alternative implementation.
(define (prefix2 list1 list2)
  (suffix (reverse list1) (reverse list2)))

(prefix2 '(3 4) '(1 2 3 4)) ; #f
(prefix2 '(1 2) '(1 2 3 4)) ; #t

;;; Converts a non-negative integer into a list of it's base-10 digits.
(define (digits x)
  (if (< x 10)
      (list x)
      (append (digits (quotient x 10))
              (list (remainder x 10)))))

(digits 123456789) ; (1 2 3 4 5 6 7 8 9)
(digits 0) ; (0)

;;; Compute the average items of a list of items.
(define (average items)
  (/ (sum items) (length items)))

(define (sum items)
  (accumulate + 0 items))

(define (accumulate op initial items)
  (if (null? items)
      initial
      (op (car items) (accumulate op initial (cdr items)))))

(average '(1 2 3 4 5 6 7 8 9 10.0)) ; 5.5

;;; Built-in function for raising to a power.
(expt 2 10) ; 1024
(expt 2 16) ; 65536

;;; Compute the geometric mean of a list of items.
(define (geometric-mean items)
  (expt (product items)
        (/ 1.0 (length items))))

(define (product items)
  (accumulate * 1 items))

;;; Finds those elements of a list of numbers that are less than the geometric
;;; mean of the list.
(define (lower-than-gm items)
  (filter (lambda (x) (< x (geometric-mean items)))
          items))

(define (filter predicate items)
  (cond ((null? items) '())
        ((predicate (car items))
         (cons (car items) (filter predicate (cdr items))))
        (else (filter predicate (cdr items)))))

;;; Let special form:
;;;
;;;   (let ((<name1> <expr1>)
;;;         (<name2> <expr2>)
;;;        ...
;;;         (<namen> <exprn>))
;;;     <body>)
;;;
;;; Computes the expression <body> in a context in which the names
;;; are bound to the values of the corresponding expressions.
;;;
;;; Let is equivalent to:
;;;
;;;   ((lambda (<name1> <name2> ... <namen>)
;;;      <body>) <expr1> <expr2> ... <exprn>)

;;; Alternative implementation of lower-than-gm with let.
(define (lower-than-gm2 items)
  (let ((gm (geometric-mean items)))
    (filter (lambda (x) (< x gm)) items)))

;;; Finds all elements in a list that appear exactly once.
(define (unique items)
  (filter (lambda (x) (= (count x items) 1))
          items))

(define (count x items)
  (cond ((null? items) 0)
        ((equal? x (car items)) (+ 1 (count x (cdr items))))
        (else (count x (cdr items)))))

(unique '(1 2 3 4)) ; (1 2 3 4)
(unique '(1 1 2 5 4)) ; (2 5 4)

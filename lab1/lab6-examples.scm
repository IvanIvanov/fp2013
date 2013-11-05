;;; Discussion of the environment model of evaluation. A detailed explanation
;;; can be found here:
;;;
;;;     http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-21.html#%_sec_3.2
;;;

;;; Internal definitions: the functions defined inside another function have
;;; access to the other function's formal parameters.
(define (fact n)
  (define (iter i result)
    (if (> i n)
        result
        (iter (+ i 1) (* result i))))
  (iter 1 1))

(fact 10) ; 3628800

;;; Functions can be created inside other functions like in the derivative
;;; example:
(define (derivative f)
  (lambda (x)
    (/ (- (f (+ x 0.0001)) (f x))
       0.0001)))

((derivative sin) 0) ; ~ 1

;;; Creating counters using functions as return types:
(define (make-counter initial)
  (lambda ()
    (set! initial (+ initial 1))
    initial))

(define c1 (make-counter 0))
(define c2 (make-counter 0))

(c1) ; 1
(c1) ; 2
(c1) ; 3
(c2) ; 1
(c2) ; 2

;;; A detailed explanation of lexical closures can be found here:
;;;
;;;       http://en.wikipedia.org/wiki/Closure_%28computer_science%29
;;;

;;; A function that counts the number of atomic elements in a list of lists.
;;; This is the same as the number of leaves in the tree defined by the nested
;;; lists.
(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves (car tree))
                 (count-leaves (cdr tree))))))

(count-leaves '((1 2) 3 (4 (5 6)))) ; 6

;;; A function that takes a list of lists and produces a new list that
;;; is composed of only the atomic elements contained in the lists.
(define (flatten tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (accumulate append '() (map flatten tree)))))

(define (accumulate op initial items)
  (if (null? items)
      initial
      (op (car items) (accumulate op initial (cdr items)))))

(flatten '(1 2 3 4)) ; (1 2 3 4)
(flatten '((1 2) 3 (4 (5 6)))) ; (1 2 3 4 5 6)

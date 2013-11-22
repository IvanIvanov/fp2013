;;; Cheat sheet of built-in functions in Scheme.

;;; Functions for working with numbers.
(even? 2) ; #t
(even? 1) ; #f

(odd? 2) ; #f
(odd? 1) ; #t

; a^b
(expt 2 10) ; 1024

(sqrt 16) ; 4

(min 1 2) ; 1
(min 1 2 3 4 5 6 7 8 9 10) ; 1

(max 1 2) ; 2
(max 1 2 3 4 5 6 7 8 9 10) ; 10

; Remainder and division with whole numbers. 
(remainder 10 3) ; 1
(remainder 12 3) ; 0

(quotient 10 3) ; 3
(quotient 12 3) ; 4

;;; Built-in functions for working with booleans.
(and #t #t) ; #t
(and #t #f) ; #f

(or #t #f) ; #t
(or #f #f) ; #f

(not #t) ; #f
(not #f) ; #t

;;; Built-in functions for working with lists.

; Creating a pair - warning a pair is not a list.
(cons 1 2) ; (1 . 2)
(cons 2 1) ; (2 . 1)

; Creating a list - a sequence of linked pairs who's last pair has a second
; element pointing to the empty list '()
(cons 1 '()) ; (1)
(cons 1 (cons 2 '())) ; (1 2)

(list) ; ()
(list 1) ; (1)
(list 1 2) ; (1 2)
(list (+ 0 1) (* 1 2)) ; (1 2)
(list 1 2 3 4 5 6 7 8 9 10) ; (1 2 3 4 5 6 7 8 9 10)

'() ; ()
'(1) ; (1)
'(1 2) ; (1 2)
'((+ 0 1) (* 1 2)) ; ((+ 0 1) (* 1 2))
'(1 2 3 4 5 6 7 8 9 10) ; (1 2 3 4 5 6 7 8 9 10)


; Accessing the elements of pairs (that may or may not be organized as lists.

; The first element of a pair.
(car (cons 1 2)) ; 1
(car '(1 2)) ; 1

; The second element of a pair.
(cdr (cons 1 2)) ; 2
(cdr '(1 2)) ; (2)

; Same as (car (cdr '(1 2))).
(cadr '(1 2)) ; 2

; Same as (cdr (car '((1 2) 3))).
(cdar '((1 2) 3)) ; (2)

; The empty list.
'()

; Checks if something is the empty list.
(null? '()) ; #t
(null? '(1 2 3)) ; #f

; Checks if something is a pair.
(pair? (cons 1 2)) ; #t
(pair? '(1 2 3 4)) ; #t
(pair? 1) ; #f

; Checks if something is an atom - not a pair.
(not (pair? (cons 1 2))) ; #f
(not (pair? '(1 2 3 4))) ; #f
(not (pair? 1)) ; #t

; Finds the length of a list.
(length '()) ; 0
(length '(1 2 3)) ; 3
(length '((1 2 3) (4 5) (6) (7 8))) ; 4

; Reverses a list.
(reverse '()) ; ()
(reverse '(1 2 3)) ; (3 2 1)

; Puts two lists one after the other.
(append '() '()) ; ()
(append '(1 2 3) '(4 5 6)) ; (1 2 3 4 5 6)

; Applies a function over each element of a list.
(map (lambda (x) (* x x)) '(1 2 3 4)) ; (1 4 9 16)

; NOT BUILT-IN
; A function that filters all elements of a list by only keeping those
; elements that satisfy a predicate given as an argument.
(define (filter predicate items)
  (cond ((null? items) '())
        ((predicate (car items))
         (cons (car items) (filter predicate (cdr items))))
        (else (filter predicate (cdr items)))))

(filter even? '(1 2 3 4)) ; (2 4)
(filter odd?  '(1 2 3 4)) ; (1 3)

; NOT BUILT-IN
; Aggregates elements of a list with a specific operator and initial value.
(define (accumulate op initial items)
  (if (null? items)
      initial
      (op (car items)
          (accumulate op initial (cdr items)))))

(accumulate + 0 '(1 2 3 4 5)) ; 15
(accumulate * 1 '(1 2 3 4 5)) ; 120

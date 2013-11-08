(define (reduce oper start-value l)
  (cond
    ( (null? l) start-value)
    (else (reduce oper (oper start-value (car l)) (cdr l)))))
 
; намира най-малкия елемент в даден списък
(define (min-el l)
  (reduce (lambda (a b) (min a b)) (car l) l))
 
(define (min-of-lists L)
  (map (lambda (current-list) (min-el current-list)) L))
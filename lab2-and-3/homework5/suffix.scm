(define (take l n)
  (cond
    ( (null? l) (list) )
    ( (= n 0) (list) )
    (else (cons (car l) (take (cdr l) (- n 1))))))
 
(define (prefix? l1 l2)
  (equal? l1 (take l2 (length l1))))
 
(define (suffix? l1 l2)
  (prefix? (reverse l1) (reverse l2)))
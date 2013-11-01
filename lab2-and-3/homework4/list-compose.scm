(define (compose f g)
  (lambda (x) (g (f x))))

; l e списък от фунцкии
(define (list-compose l)
  (define (list-compose-iter l result)
    (cond
      ( (null? l) result )
      (else (list-compose-iter (cdr l) (compose (car l) result)))))
  (list-compose-iter  (cdr l) (car l)))
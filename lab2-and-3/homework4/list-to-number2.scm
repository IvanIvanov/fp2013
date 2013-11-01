; слепя две числа заедно
(define (glue-ints a b)
  (+ (* a 10) b))

(define (drop-while l pred?)
  (cond
    ( (null? l) (list))
    ( (not (pred? (car l))) l)
    (else (drop-while (cdr l) pred?))))

(define (reduce l oper start-value)
  (cond
    ( (null? l) start-value)
    (else (reduce (cdr l) oper (oper start-value (car l))))))

(define (list-to-number l)
  (define zeroless-list (drop-while l (lambda (x) (= x 0))))
  (reduce zeroless-list  glue-ints 0))
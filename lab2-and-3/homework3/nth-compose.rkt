(define (double x) (* x 2))
(define (triple x) (* x 3))
(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x) (g (f x))))

; nth-compose използва n-1 пъти compose
(define (nth-compose f n)
  (define (nth-compose-iter f n result)
    (cond
      ( (= n 1)  result)
      (else (nth-compose-iter f (- n 1) (compose f result)))))
  
  (nth-compose-iter f n f))

( (nth-compose double 2) 2) ; 8
( (nth-compose triple 2) 2) ; 18
( (nth-compose inc 10) 1) ; 11
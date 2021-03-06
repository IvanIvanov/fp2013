(define (compose f g)
  (lambda (x) (g (f x))))

; nth-compose използва n-1 пъти compose
(define (nth-compose f n)
  (define (nth-compose-iter f n result)
    (cond
      ( (= n 1)  result)
      (else (nth-compose-iter f (- n 1) (compose f result)))))
  
  (nth-compose-iter f n f))
